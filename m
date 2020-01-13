Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D6439138C24
	for <lists.virtualization@lfdr.de>; Mon, 13 Jan 2020 08:04:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5DCC986A07;
	Mon, 13 Jan 2020 07:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LTQ8qB3dPfDm; Mon, 13 Jan 2020 07:04:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7A66486FDE;
	Mon, 13 Jan 2020 07:04:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 255A7C1D8D;
	Mon, 13 Jan 2020 07:04:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C75EC077D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 07:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2CB2786D41
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 07:04:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F8v+f4Jy-l2N
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 07:03:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2FA6A81D5F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 07:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578899037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hI0wBd6yBICNdhwF8MR0DfSEvIQjrDyuB/ytyZ9IVZg=;
 b=Y085HXcSfJSKzOhtIsAGMx3EvcWQgWZoU9MF1Y+3ZviVltYyZ2zx1JS/aFUNbQpXib8hQ7
 edleJOyqClHh7E7hfqPuug3PrAqVGXKN/8JBmFVX0Nr0w3jUKP8BLtFV8JDRQmtUWEummh
 XS0TJ/UR5ipVho9SGSdeqz9EFJYWaCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-TDxC-S3gNN6XD58c0_D23Q-1; Mon, 13 Jan 2020 02:03:56 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A3D418FE860;
 Mon, 13 Jan 2020 07:03:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBD6C1001DD7;
 Mon, 13 Jan 2020 07:03:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2AB0A9DA5; Mon, 13 Jan 2020 08:03:54 +0100 (CET)
Date: Mon, 13 Jan 2020 08:03:54 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: bochs_drm: failed bochs_hw_init() results in panic
Message-ID: <20200113070354.hwozz5zhkifn7ted@sirius.home.kraxel.org>
References: <20200110013328.GA12596@mail-itl>
 <20200110053553.4gqlagjdpfi6pg3b@sirius.home.kraxel.org>
 <20200111000745.GF2507@mail-itl>
MIME-Version: 1.0
In-Reply-To: <20200111000745.GF2507@mail-itl>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: TDxC-S3gNN6XD58c0_D23Q-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

> Now the messages looks like this:
> 
> [   29.800835] bochs-drm 0000:00:02.0: remove_conflicting_pci_framebuffers: bar 0: 0xc0000000 -> 0xc0ffffff
> [   29.800840] bochs-drm 0000:00:02.0: remove_conflicting_pci_framebuffers: bar 2: 0xc1087000 -> 0xc1087fff
> [   29.800842] checking generic (c0000000 1000000) vs hw (c0000000 1000000)
> [   29.800843] fb0: switching to bochsdrmfb from EFI VGA
> [   29.805542] bochs-drm 0000:00:02.0: vgaarb: deactivate vga console
> [   29.805742] bochs-drm 0000:00:02.0: BAR 0: can't reserve [mem 0xc0000000-0xc0ffffff pref]
> [   29.805749] [drm:bochs_hw_init [bochs_drm]] *ERROR* Cannot request framebuffer

This is the problem.

> [   29.805781] bochs-drm: probe of 0000:00:02.0 failed with error -16
> [   30.129014] Trying to free nonexistent resource <00000000c0000000-00000000c0ffffff>
> 
> Is the last one an issue?

Not critical.  Probably the pci_release_regions() call, trying to free
all regions, including the one the driver could not request, so it warns
about that one.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
