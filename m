Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6779C8C284
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 23:03:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4D9A23EE;
	Tue, 13 Aug 2019 21:03:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9F1E43EE
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 21:03:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 167B28A9
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 21:03:14 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q12so18779224wrj.12
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 14:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tEhHgLcqlA5tSM/U7PsVGRMmj61U+t1w86jQUqeFNZo=;
	b=pRzakrLUzGxlbvAHPJv9+ozEZAKjz6+pgSRb4cdyLT4uGiuoeXxCcLGC8MWcYCHgCf
	7HWdeQ3lQb4bkExzvXGKzpWMMHCnhI5Cf55cpmJquCWUhzPzPIcmmzNMMT5mwS6PAtbP
	pBtWbzLmhnA1IgWU/SzsYTGmS3TrYuolC4GpYrWXs6IrWC1OIyu6RUDrcMuiTO/kv5LS
	Ul7iztdWUxRILzVK3neIZWQerMKPHqoEOW66+2ujh/aArWDfemTGU78PGf4o7GQ4qjfu
	YR3/EspVGc+qKF3NA2tk6fU5Mul3SoLXYEdlQQdlUMNGxFtMDPjfZ3ObBublPmvhLbOh
	XRXA==
X-Gm-Message-State: APjAAAVDXubE7ns/86EPXRi+tZ0izIXymVSbDze54tpcbcqS61Y6Z2wG
	LkvwkbyJeVIFjq/cR5Upicp+rA==
X-Google-Smtp-Source: APXvYqzCH0YYNT+mm2NCMtG/p/XSQ0nRVPLtvaYvNv2whhtGv6yScErnL+PDu/Cb4oX9gIIDZ6+Shg==
X-Received: by 2002:a05:6000:14b:: with SMTP id
	r11mr48965825wrx.196.1565730192616; 
	Tue, 13 Aug 2019 14:03:12 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
	by smtp.gmail.com with ESMTPSA id u8sm1872737wmj.3.2019.08.13.14.03.11
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 14:03:11 -0700 (PDT)
Subject: Re: [RFC PATCH v6 01/92] kvm: introduce KVMI (VM introspection
	subsystem)
To: Sean Christopherson <sean.j.christopherson@intel.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-2-alazar@bitdefender.com>
	<20190812202030.GB1437@linux.intel.com>
	<5d52a5ae.1c69fb81.5c260.1573SMTPIN_ADDED_BROKEN@mx.google.com>
	<5fa6bd89-9d02-22cd-24a8-479abaa4f788@redhat.com>
	<20190813150128.GB13991@linux.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <add4f505-7011-c7f4-2361-c8814cac2424@redhat.com>
Date: Tue, 13 Aug 2019 23:03:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813150128.GB13991@linux.intel.com>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>,
	Yu C <yu.c.zhang@intel.com>, kvm@vger.kernel.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?Q?Samuel_Laur=c3=a9n?= <samuel.lauren@iki.fi>,
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	Zhang@vger.kernel.org, virtualization@lists.linux-foundation.org,
	=?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?Q?Mircea_C=c3=aerjaliu?= <mcirjaliu@bitdefender.com>,
	=?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On 13/08/19 17:01, Sean Christopherson wrote:
>>> It's a bit unclear how, but we'll try to get ride of the refcount object,
>>> which will remove a lot of code, indeed.
>> You can keep it for now.  It may become clearer how to fix it after the
>> event loop is cleaned up.
> By event loop, do you mean the per-vCPU jobs list?

Yes, I meant event handling (which involves the jobs list).

Paolo
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
