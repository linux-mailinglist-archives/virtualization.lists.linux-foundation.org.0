Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BD68D3DA
	for <lists.virtualization@lfdr.de>; Wed, 14 Aug 2019 14:53:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 07ABD1036;
	Wed, 14 Aug 2019 12:53:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 33ABC1026
	for <virtualization@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 12:53:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B0C5976D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 12:53:49 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z23so4370535wmf.2
	for <virtualization@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 05:53:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=w/9WmrcXj+WSf8mG3UP1CEm5oCxjeGmdpSMvc0IgVzQ=;
	b=okxMpywFJ0YqRhELZdfJWRqfZATqhVKTUabsI6sCW7wlXFh2lkKlauziBryH2zwpmW
	5ywD7q5XWoEaekvr6ctA2Hu2Uy3Kq977NLQDmNFvztSR/vQ1bYZsTmwn3dWE5cjf3/hN
	d4TNghLh3H6pD6VDiTmhaTUzlwoK/iTZRXU0Ox3ktabLLKp/EPWa5uqvUWeFB+sRzHG/
	zwZEsTsyZjfo56V2V073qOBAmSBqtwU9pDHatWdoGbh73aVSOkVH5YRTvGpJcP7idPcZ
	grXmlQ4268aV0QwHcdhDHBDbmAABLLUJpP5LoqSgb4hImzs2d+BQ6pb7tC1Bfe2DBhEz
	tC8A==
X-Gm-Message-State: APjAAAXMqcK1Yp7XHPxDc2O1T744QDbeavGwlZ1D69PbKrkctLu0Xoj+
	TEPEzJ2ygC1ErN5EWWLtQ9SdWw==
X-Google-Smtp-Source: APXvYqzEPFLFieg69AnBNaGIyKSm/YC4cyNCjZwla3TXgTG28lqZ11s6Gsx1a538xj5khmA4ksXdvw==
X-Received: by 2002:a1c:c018:: with SMTP id q24mr8315429wmf.162.1565787228293; 
	Wed, 14 Aug 2019 05:53:48 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
	by smtp.gmail.com with ESMTPSA id
	d19sm28086256wrb.7.2019.08.14.05.53.46
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Aug 2019 05:53:47 -0700 (PDT)
Subject: Re: [RFC PATCH v6 64/92] kvm: introspection: add single-stepping
To: Nicusor CITU <ncitu@bitdefender.com>,
	Sean Christopherson <sean.j.christopherson@intel.com>,
	=?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-65-alazar@bitdefender.com>
	<20190812205038.GC1437@linux.intel.com>
	<f03ff5fbba2a06cd45d5bebb46da4416bc58e968.camel@bitdefender.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <5851eb00-3d00-1213-99cb-7bab2da3ba89@redhat.com>
Date: Wed, 14 Aug 2019 14:53:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f03ff5fbba2a06cd45d5bebb46da4416bc58e968.camel@bitdefender.com>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>,
	"Zhang@linux.intel.com" <Zhang@linux.intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?Q?Samuel_Laur=c3=a9n?= <samuel.lauren@iki.fi>,
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	Joerg Roedel <joro@8bytes.org>, "virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Yu C <yu.c.zhang@intel.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>,
	Jim Mattson <jmattson@google.com>
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

On 14/08/19 14:36, Nicusor CITU wrote:
> Thank you for signaling this. This piece of code is leftover from the
> initial attempt to make single step running.
> Based on latest results, we do not actually need to change
> interruptibility during the singlestep. It is enough to enable the MTF
> and just suppress any interrupt injection (if any) before leaving the
> vcpu entering in guest.
> 

This is exactly what testcases are for...

Paolo
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
