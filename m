Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B475CB973
	for <lists.virtualization@lfdr.de>; Fri,  4 Oct 2019 13:47:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D3F61E71;
	Fri,  4 Oct 2019 11:47:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 90B94DD6
	for <virtualization@lists.linux-foundation.org>;
	Fri,  4 Oct 2019 11:47:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 29BD9D3
	for <virtualization@lists.linux-foundation.org>;
	Fri,  4 Oct 2019 11:47:02 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 475DA3D965
	for <virtualization@lists.linux-foundation.org>;
	Fri,  4 Oct 2019 11:47:01 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id g67so1508620wmg.4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 04 Oct 2019 04:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+JwHgoEwrxaFZwrDe7mi7c34P6AQjAcW/4AJU211S7o=;
	b=cuALutiBzeVi0TZFNs+WaNQPHLdSKyTDUYuHOo2/UzzaxRCt8I8IGx+vkV5U1Yp3ah
	uS8AsZN4Cvvazl1FLjyOSuBqukcIEZb3ZDuCpfAEcefFRyEEEiBZ+vvdbbQoHPS2Lqor
	XKJc5OSm9j3f1ORxEWXDLjRfhxt28MrAzLrsA1l0tn2Uuwecd0TEwTko2w4Ur+vNaZ88
	rt6I+4H+VbJELRad+g6NQzdUaI0WvMXhntxPm/x95Dy6CUzkpdpfqPRlJzZA3DSzU9Td
	9XIJI7zGB/6xOKUzq9CXsd66XUYpOGsjEtpRLxYylec3+CvUEljGNHz0gwyoUVOKx4aT
	X01Q==
X-Gm-Message-State: APjAAAXATqzZ6HkUH/onp0+q7hl56s3PzeFUmUEyuw6yGVkqgdPEVPeE
	0aGOnhRSGukNq5sPr+kctAvJ0FaVB4zx9e/PMTYiwpiVM8dhF+7G4dumhwF+PzJsGb7K5AM/v43
	ercbJ2O1vejXbgITAPkTYnwqH26J1cC3bHYaKxREifg==
X-Received: by 2002:a1c:61d6:: with SMTP id v205mr9957519wmb.35.1570189619911; 
	Fri, 04 Oct 2019 04:46:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyH/UQA0Hna+4tQRdNy2xgtBfIwlleCnezIJHKLxXIn6EMeOpPWe6+zaMeL8aGp+kphYLAp6g==
X-Received: by 2002:a1c:61d6:: with SMTP id v205mr9957481wmb.35.1570189619580; 
	Fri, 04 Oct 2019 04:46:59 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:e56d:fbdf:8b79:c79c?
	([2001:b07:6468:f312:e56d:fbdf:8b79:c79c])
	by smtp.gmail.com with ESMTPSA id
	y186sm11299530wmb.41.2019.10.04.04.46.56
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 04 Oct 2019 04:46:58 -0700 (PDT)
Subject: Re: DANGER WILL ROBINSON, DANGER
To: Mircea CIRJALIU - MELIU <mcirjaliu@bitdefender.com>,
	Jerome Glisse <jglisse@redhat.com>
References: <DB7PR02MB3979D1143909423F8767ACE2BBB60@DB7PR02MB3979.eurprd02.prod.outlook.com>
	<20191002192714.GA5020@redhat.com>
	<ab461f02-e6cd-de0f-b6ce-0f5a95798eaa@redhat.com>
	<20191002141542.GA5669@redhat.com>
	<f26710a4-424f-730c-a676-901bae451409@redhat.com>
	<20191002170429.GA8189@redhat.com>
	<dd0ca0d3-f502-78a1-933a-7e1b5fb90baa@redhat.com>
	<20191003154233.GA4421@redhat.com>
	<d62a6720-e069-4e03-6a3a-798c020786f7@redhat.com>
	<DB7PR02MB39796440DC81A5B53E86F029BB9F0@DB7PR02MB3979.eurprd02.prod.outlook.com>
	<20191003183108.GA3557@redhat.com>
	<afe2cf69-5c2c-95af-88ce-f3814fece2e2@redhat.com>
	<DB7PR02MB39795E622880231C8F8A6478BB9E0@DB7PR02MB3979.eurprd02.prod.outlook.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <7ccbc431-0ca6-0049-fe60-ad232c628209@redhat.com>
Date: Fri, 4 Oct 2019 13:46:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <DB7PR02MB39795E622880231C8F8A6478BB9E0@DB7PR02MB3979.eurprd02.prod.outlook.com>
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

On 04/10/19 11:41, Mircea CIRJALIU - MELIU wrote:
> I get it so far. I have a patch that does mirroring in a separate VMA.
> We create an extra VMA with VM_PFNMAP/VM_MIXEDMAP that mirrors the 
> source VMA in the other QEMU and is refreshed by the device MMU notifier.

So for example on the host you'd have a new ioctl on the kvm file
descriptor.  You pass a size and you get back a file descriptor for that
guest's physical memory, which is mmap-able up to the size you specified
in the ioctl.

In turn, the file descriptor would have ioctls to map/unmap ranges of
the guest memory into its mmap-able range.  Accessing an unmapped range
produces a SIGSEGV.

When asked via the QEMU monitor, QEMU will create the file descriptor
and pass it back via SCM_RIGHTS.  The management application can then
use it to hotplug memory into the destination...

> Create a new memslot based on the mirror VMA, hotplug it into the guest as
> new memory device (is this possible?) and have a guest-side driver allocate 
> pages from that area.

... using the existing ivshmem device, whose BAR can be accessed and
mmap-ed from the guest via sysfs.  In other words, the hotplugging will
use the file descriptor returned by QEMU when creating the ivshmem device.

We then need an additional mechanism to invoke the map/unmap ioctls from
the guest.  Without writing a guest-side driver it is possible to:

- pass a socket into the "create guest physical memory view" ioctl
above.  KVM will then associate that KVMI socket with the newly created
file descriptor.

- use KVMI messages to that socket to map/unmap sections of memory

> Redirect (some) GFN->HVA translations into the new VMA based on a table 
> of addresses required by the introspector process.

That would be tricky because there are multiple paths (gfn_to_page,
gfn_to_pfn, etc.).

There is some complication in this because the new device has to be
plumbed at multiple levels (KVM, QEMU, libvirt).  But it seems like a
very easily separated piece of code (except for the KVMI socket part,
which can be added later), so I suggest that you contribute the KVM
parts first.

Paolo
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
