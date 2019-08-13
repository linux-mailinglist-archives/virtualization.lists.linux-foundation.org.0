Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B62AC8B7E4
	for <lists.virtualization@lfdr.de>; Tue, 13 Aug 2019 14:03:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 37762CC9;
	Tue, 13 Aug 2019 12:03:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AC181C75
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 12:03:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2A6E587E
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 12:03:02 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id v15so1263738wml.0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 05:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=MX7X0Tdt4CfdX/yOLamRc+yoXtYLHnncZUmS/xCOMp0=;
	b=BdDpg+OotM3GMxZDcycZ6ET7VxcKxNiWwOUoXuzX9YKPSiVijXKYw8Hdf1tn6MNNzc
	BSPOkNYyhfxBCfxZqmWeHop8Ev/c5DmaQjQ++8pF8ZYySMlHl4T8bDX3sfRTgfQhZa0N
	380IR0rsSxtU8MFJGNfrEs0+/8V6GeL3z8NiaCPidm4HRb0H4LDry9sPlr9oq/1VbAWb
	1ViG08lb2pMzCRftI0aWLy8rhNh2akRxI7EigwAjpTBUXIzvOz1312SwAbh0TlumxUxE
	M7vLbnDzE/o1QY2VtGonER+zqlVnP/B7UJDI/q46EMQVhB381KdWQrGNn9hGO5VUhAcU
	MaTg==
X-Gm-Message-State: APjAAAXzXUrgwSbczvzntaeQ/0zTtKyAc2r9rUmG0DL4VLEJdaMa31Qg
	Uqgg2wtRUHeVvsruqrL5bVH70g==
X-Google-Smtp-Source: APXvYqx63jmoFRwdi2jV2fOjTMCgfgZMJXNx+Msiu64sQdnLWei7VvJgxwF+ydu6THkk6ZGBzqYBBg==
X-Received: by 2002:a1c:c005:: with SMTP id q5mr2650468wmf.59.1565697780602;
	Tue, 13 Aug 2019 05:03:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:5193:b12b:f4df:deb6?
	([2001:b07:6468:f312:5193:b12b:f4df:deb6])
	by smtp.gmail.com with ESMTPSA id p10sm1466831wma.8.2019.08.13.05.02.59
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Aug 2019 05:02:59 -0700 (PDT)
Subject: Re: DANGER WILL ROBINSON, DANGER
To: Matthew Wilcox <willy@infradead.org>
References: <20190809160047.8319-1-alazar@bitdefender.com>
	<20190809160047.8319-72-alazar@bitdefender.com>
	<20190809162444.GP5482@bombadil.infradead.org>
	<ae0d274c-96b1-3ac9-67f2-f31fd7bbdcee@redhat.com>
	<20190813112408.GC5307@bombadil.infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <b6735416-602a-a2f5-5099-7e87c5162a6b@redhat.com>
Date: Tue, 13 Aug 2019 14:02:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813112408.GC5307@bombadil.infradead.org>
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
	virtualization@lists.linux-foundation.org,
	=?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Zhang@kvack.org,
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

On 13/08/19 13:24, Matthew Wilcox wrote:
>>>
>>> This is an awfully big patch to the memory management code, buried in
>>> the middle of a gigantic series which almost guarantees nobody would
>>> look at it.  I call shenanigans.
>> Are you calling shenanigans on the patch submitter (which is gratuitous)
>> or on the KVM maintainers/reviewers?
>
> On the patch submitter, of course.  How can I possibly be criticising you
> for something you didn't do?

No idea.  "Nobody would look at it" definitely includes me though.

In any case, water under the bridge.  The submitter did duly mark the
series as RFC, I don't see anything wrong in what he did apart from not
having testcases. :)

Paolo
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
