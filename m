Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A4427FFF
	for <lists.virtualization@lfdr.de>; Thu, 23 May 2019 16:41:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2494AEE6;
	Thu, 23 May 2019 14:41:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C8559EB7
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 14:41:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B35267FB
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 14:41:30 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id l17so5662634otq.1
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 07:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QBmnu1LEmcuyOzLtmMtO+yAs7pP/eUMlcW70tRmCsiY=;
	b=edZUaSYZg8WHocXE30PmdS9NHHHsnT8ZmKwF5+ZnzKEJ87s4KYIo6Ivbp8PrZQlVCH
	MUE8/Sxg2IxqWMTTZ1kMzkv6HOILobHtqvBVNJVaQvCBcnOrMkPNu3AT0P+9w3ySZ0oj
	kotydb+smt9ecozOgWowNKYODBkYi1kDOFUaUaMJI5CmQ0+jFwA3PqfRG3lTqK4+cPOK
	sunO+bNiOqO6dG9cV1OK3UDjbmoIxSpRawUBpUpOGXF4GopdCbhv9IxOL/52IbEPESyb
	0SehgGXNef3WWbSheUj70BeJayzWOiFSkMaIo89eEYulqD+J60wInc/Dcq7g5C/HRGeu
	91QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QBmnu1LEmcuyOzLtmMtO+yAs7pP/eUMlcW70tRmCsiY=;
	b=FUV4tJGniK/cGAQZrFmi3pGV8c4N8nlK/9EUVCHDzM3ZFmNs40DNP+zDh8VMifZPFL
	aNGjFdMCwP4Hh6uOLvhKLbkenYyAVUCbQk3U1PCD7GcBYyA6dBMhJZn2J6xVfmeO5rXp
	Yiek3a7dbv1zqBsu8n/jSvKin7qUKx9SltM+4hJJTYoIyl2rsfY4eKm94eN966OUsRM2
	CaUeRfJVYxORSS6XoQOzP6Ng+Kjr7da+YAjmxPUOdqAHaFSMGsrySlnWxX4m02am7np8
	bpFgTG2PlyLI36bUNcfgQCbPi9ucGEfmMzrWvb1SvDGnM0Aikql7jjLNTEUvp0C/L5sa
	zLaQ==
X-Gm-Message-State: APjAAAWs/Xe1vST6B60Xdw05ECe/61NqPBhB09q3d1nVDFcvy8LfBQ6e
	ym4Pfe5c1ecJiuT29bqgKerp+tFBABKCT86qbnw=
X-Google-Smtp-Source: APXvYqygrOm5yXUSAqIlzuakeusNYiyGsqOCm5Z0qlbnOO3HNuGKS1EFt61JKl1e2yIg91Laj/1LHd3CzSqH6FL9jp0=
X-Received: by 2002:a9d:7d9a:: with SMTP id j26mr6360770otn.102.1558622489921; 
	Thu, 23 May 2019 07:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <0952696452f5ff4e38d2417029243fc60efa33d6.camel@sipsolutions.net>
	<20190523115950.GH26632@stefanha-x1.localdomain>
	<41d64b8971a097d1568f947517b45d09c156ccc8.camel@sipsolutions.net>
In-Reply-To: <41d64b8971a097d1568f947517b45d09c156ccc8.camel@sipsolutions.net>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 23 May 2019 15:41:18 +0100
Message-ID: <CAJSP0QWSZXT3OJAc=abagD40xZ7DWWrcP_+AwVBuqQyQNgaOEg@mail.gmail.com>
Subject: Re: [Qemu-devel] custom virt-io support (in user-mode-linux)
To: Johannes Berg <johannes@sipsolutions.net>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: ido@wizery.com, linux-um@lists.infradead.org,
	qemu-devel <qemu-devel@nongnu.org>,
	Linux Virtualization <virtualization@lists.linux-foundation.org>
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

On Thu, May 23, 2019 at 3:25 PM Johannes Berg <johannes@sipsolutions.net> wrote:
> Not sure I understand why there's all this stuff about multiple FDs,
> once you have access to the guest's memory, why do you still need a
> second (or more) FDs?

The memory regions could be different files (maybe additional RAM was
hotplugged later).

> Also, not sure I understand how the client is started?

The vhost-user device backend can be launched before QEMU.  QEMU is
started with the UNIX domain socket path so it can connect.

QEMU itself doesn't fork+exec the vhost-user device backend.  It's
expected that the user or the management stack has already launched
the vhost-user device backend.

> Once we have a connection, I guess as a client I'd at the very least
> have to handle
>  * VHOST_USER_GET_FEATURES and reply with the features, obviously, which
>    is in this case just VHOST_USER_F_PROTOCOL_FEATURES?
>
>  * VHOST_USER_SET_FEATURES - not sure, what would that do? the master
>    sends VHOST_USER_GET_PROTOCOL_FEATURES which is with this feature
>    bit? Especially since it says: "Slave that reported
>    VHOST_USER_F_PROTOCOL_FEATURES must support this message even before
>    VHOST_USER_SET_FEATURES was called."
>
>  * VHOST_USER_GET_PROTOCOL_FEATURES - looking at the list, most I don't
>    really need here, but OK
>
>  * VHOST_USER_SET_OWNER - ??
>
>  * VHOST_USER_RESET_OWNER - ignore
>
>  * VHOST_USER_SET_MEM_TABLE - store the data/FDs for later use, I guess
>
>  * VHOST_USER_SET_VRING_NUM - store the data for later use
>  * VHOST_USER_SET_VRING_ADDR - dito
>  * VHOST_USER_SET_VRING_BASE - dito
>  * VHOST_USER_SET_VRING_KICK - start epoll on the FD (assuming there is
>                                one, give up if not?) - well, if ring is
>                                enabled?
>  * VHOST_USER_SET_VRING_CALL - ...
>
> I guess there might be better documentation on the ioctl interfaces?
>
>
> Do you know if there's a sample client/server somewhere?

See contrib/libvhost-user in the QEMU source tree as well as the
vhost-user-blk and vhost-user-scsi examples in the contrib/ directory.

Stefan
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
