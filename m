Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F22C8E1B
	for <lists.virtualization@lfdr.de>; Wed,  2 Oct 2019 18:18:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0B6B9135F;
	Wed,  2 Oct 2019 16:18:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 41D62135B
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 16:18:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DCC5C8D5
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 16:18:11 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 303445D66B
	for <virtualization@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 16:18:11 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id 4so2283939wmj.6
	for <virtualization@lists.linux-foundation.org>;
	Wed, 02 Oct 2019 09:18:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/v3cLVQkUXMFYA41ytcIYtOGrK2O1kisY2oYiPOm+oU=;
	b=tfxYmhD3tMihFM2tv6sN5c7yBKgBnNUixSPpBiyFk9kYSSQJidxsk+tuz8Omw2CqzU
	sU1w0R43qCOiYWF2F6EeBibQ6nQkogzEZWMFAzAzivaFukTo2BASOSlOe5wjUtXp4+rn
	tqsM59yCSAElwBj9A2oZ220X2PiCp9eWKRqiesrH3D7TdKEWO3/0KQqlgGX1zHKO6ax+
	1qDIGdundOY8NNX7ibxGsj2/s4LRHErE8Zybq9jcITRv/GAj5KCbDHXeVBkQPiOvBxCH
	GEhrK9UYuHYsKT78XOzoNWG3ESX27+wcK9BJtovCavZxHOtuvlScPzp/E2J30wUgkF7y
	MfHg==
X-Gm-Message-State: APjAAAW2RinWOGVRmdIw2GfcPd2yjqX8A7+j4rrpRqPBuq3RpgLMGlcM
	GzjbAttjq4iBzVN6PYabaOD1rueax1+C9lTrPdx/EsRynCE9Q/MDqAS8hXtJhNMKsa1oG/Tmhv/
	v1qUXHax4M5PjeNbY4ypK8zfRv7EvbrfxYlYyL0Z41Q==
X-Received: by 2002:adf:f1d1:: with SMTP id z17mr3285343wro.330.1570033089761; 
	Wed, 02 Oct 2019 09:18:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzdXxh5wz8G/f4mQKDqgI/sCIg/sY1v8M+KqylLMhEoh0g4kEjcKivr4dgFmTlgMkBHXTJsOw==
X-Received: by 2002:adf:f1d1:: with SMTP id z17mr3285315wro.330.1570033089460; 
	Wed, 02 Oct 2019 09:18:09 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
	by smtp.gmail.com with ESMTPSA id
	i11sm9448102wrq.48.2019.10.02.09.18.07
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 02 Oct 2019 09:18:08 -0700 (PDT)
Subject: Re: DANGER WILL ROBINSON, DANGER
To: Jerome Glisse <jglisse@redhat.com>
References: <20190809162444.GP5482@bombadil.infradead.org>
	<1565694095.D172a51.28640.@15f23d3a749365d981e968181cce585d2dcb3ffa>
	<20190815191929.GA9253@redhat.com> <20190815201630.GA25517@redhat.com>
	<VI1PR02MB398411CA9A56081FF4D1248EBBA40@VI1PR02MB3984.eurprd02.prod.outlook.com>
	<20190905180955.GA3251@redhat.com>
	<5b0966de-b690-fb7b-5a72-bc7906459168@redhat.com>
	<DB7PR02MB3979D1143909423F8767ACE2BBB60@DB7PR02MB3979.eurprd02.prod.outlook.com>
	<20191002192714.GA5020@redhat.com>
	<ab461f02-e6cd-de0f-b6ce-0f5a95798eaa@redhat.com>
	<20191002141542.GA5669@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <f26710a4-424f-730c-a676-901bae451409@redhat.com>
Date: Wed, 2 Oct 2019 18:18:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002141542.GA5669@redhat.com>
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

On 02/10/19 16:15, Jerome Glisse wrote:
>>> Why would you need to target mmu notifier on target vma ?
>> If the mapping of the source VMA changes, mirroring can update the
>> target VMA via insert_pfn.  But what ensures that KVM's MMU notifier
>> dismantles its own existing page tables (so that they can be recreated
>> with the new mapping from the source VMA)?
>>
> So just to make sure i follow we have:
>       - qemu process on host with anonymous vma
>             -> host cpu page table
>       - kvm which maps host anonymous vma to guest
>             -> kvm guest page table
>       - kvm inspector process which mirror vma from qemu process
>             -> inspector process page table
> 
> AFAIK the KVM notifier's will clear the kvm guest page table whenever
> necessary (through kvm_mmu_notifier_invalidate_range_start). This is
> what ensure that KVM's dismatles its own mapping, it abides to mmu-
> notifier callbacks. If you did not you would have bugs (at least i
> expect so). Am i wrong here ?

The KVM inspector process is also (or can be) a QEMU that will have to
create its own KVM guest page table.

So if a page in the source VMA is unmapped we want:

- the source KVM to invalidate its guest page table (done by the KVM MMU
notifier)

- the target VMA to be invalidated (easy using mirroring)

- the target KVM to invalidate its guest page table, as a result of
invalidation of the target VMA

Paolo
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
