Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 62802CA15E
	for <lists.virtualization@lfdr.de>; Thu,  3 Oct 2019 17:51:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6E44410D8;
	Thu,  3 Oct 2019 15:50:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BBE9910D8
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 15:50:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6530B5D3
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 15:50:54 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C2C6083F4C
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 15:50:53 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id v18so1292465wro.16
	for <virtualization@lists.linux-foundation.org>;
	Thu, 03 Oct 2019 08:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Dk0aNdQXz53G0n9Tb1zT+SP0bhczdeQIv0e4Y/L1PB4=;
	b=kHsxPfE7ldYah8yrWII7HExU03SLXVwg9l0EYZ95FuF5S3e6A0uHXww8C6UQ+p6PIf
	sq08BQPKHx1NjpOz6HilmKcf4kGzAHKHdDNNhuLpRM47rEhSzQ9Ol3TdenW+R2LMM5dr
	OpeDCEO2CXTXl9KmXkIf40P8iMI5AukINKIB8ZR8h03GQlbCo48QcsSHmH+FqsU6bKoo
	FNvlfBdnuko67gl1FYqATva8xwKirPCZ8ClNbNtNYy5ng/WQjdDUd7XG3FIWUovv558g
	2xugYPO7PKwrC8zzTldVavir4fRrNNBINHXl67iRuBrJReLjuSklS46BrE7B7eQWm+H3
	nLTQ==
X-Gm-Message-State: APjAAAVpOGsnbt4XjSSFlADY+ZW3EBtmDmJgc6ukbBYfjpJ00w83FQyh
	dKOTIhvQFF6Z3Y3wV2p1wk+wr1Wz/f6HhQthYWyMLbxQp2RQrMxdjuuwqtetOZ1EnE35oWeWvAc
	cnS9udVLR1f7zBVUU1PS2z52nV0bM21MQ4oS8nOowYg==
X-Received: by 2002:a05:600c:1103:: with SMTP id
	b3mr7656889wma.3.1570117852381; 
	Thu, 03 Oct 2019 08:50:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyyTTq1KRj0SEdnWQ7WCYfTtrUQZd+OAAW9EGTeyhKb1SxWiUABbHcl0VEgD9om8ZETiNdbGA==
X-Received: by 2002:a05:600c:1103:: with SMTP id
	b3mr7656870wma.3.1570117852120; 
	Thu, 03 Oct 2019 08:50:52 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:b903:6d6f:a447:e464?
	([2001:b07:6468:f312:b903:6d6f:a447:e464])
	by smtp.gmail.com with ESMTPSA id
	f13sm3749326wmj.17.2019.10.03.08.50.50
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 03 Oct 2019 08:50:51 -0700 (PDT)
Subject: Re: DANGER WILL ROBINSON, DANGER
To: Jerome Glisse <jglisse@redhat.com>
References: <VI1PR02MB398411CA9A56081FF4D1248EBBA40@VI1PR02MB3984.eurprd02.prod.outlook.com>
	<20190905180955.GA3251@redhat.com>
	<5b0966de-b690-fb7b-5a72-bc7906459168@redhat.com>
	<DB7PR02MB3979D1143909423F8767ACE2BBB60@DB7PR02MB3979.eurprd02.prod.outlook.com>
	<20191002192714.GA5020@redhat.com>
	<ab461f02-e6cd-de0f-b6ce-0f5a95798eaa@redhat.com>
	<20191002141542.GA5669@redhat.com>
	<f26710a4-424f-730c-a676-901bae451409@redhat.com>
	<20191002170429.GA8189@redhat.com>
	<dd0ca0d3-f502-78a1-933a-7e1b5fb90baa@redhat.com>
	<20191003154233.GA4421@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <d62a6720-e069-4e03-6a3a-798c020786f7@redhat.com>
Date: Thu, 3 Oct 2019 17:50:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191003154233.GA4421@redhat.com>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C <yu.c.zhang@intel.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?Q?Samuel_Laur=c3=a9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	=?UTF-8?Q?Adalbert_Laz=c4=83r?= <alazar@bitdefender.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Mircea CIRJALIU - MELIU <mcirjaliu@bitdefender.com>,
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

On 03/10/19 17:42, Jerome Glisse wrote:
> All that is needed is to make sure that vm_normal_page() will see those
> pte (inside the process that is mirroring the other process) as special
> which is the case either because insert_pfn() mark the pte as special or
> the kvm device driver which control the vm_operation struct set a
> find_special_page() callback that always return NULL, or the vma has
> either VM_PFNMAP or VM_MIXEDMAP set (which is the case with insert_pfn).
> 
> So you can keep the existing kvm code unmodified.

Great, thanks.  And KVM is already able to handle VM_PFNMAP/VM_MIXEDMAP,
so that should work.

Paolo
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
