Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4F2138C43
	for <lists.virtualization@lfdr.de>; Mon, 13 Jan 2020 08:19:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B213D84CCE;
	Mon, 13 Jan 2020 07:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qkgdeox5pKik; Mon, 13 Jan 2020 07:19:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 75C82847AB;
	Mon, 13 Jan 2020 07:19:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57FE8C077D;
	Mon, 13 Jan 2020 07:19:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 747EEC077D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 07:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6E1E5847AB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 07:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hws4FW-PARSt
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 07:19:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B1E97843DB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jan 2020 07:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578899986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/AD5NejvazBKUkYz0OCL/Xq/tuLsGSLITdr+L8N9i/I=;
 b=ReKfx014BzTkPamoF25gHzlZ3DyMqLVf/zD6hX4v+rRmjK5N1vUvqbjVo8vNi5ozbUFH70
 rnBFSXQIWE9cpyyvgKtikh06DFqUhLQaXQ8LnSkM82coTOz6UEWBKGFfNrJXut63ULFQbv
 iTO2o0TGMT5GCHhWFN2lviOr8etdzOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-3jzgFbShNPmTQcsKWGpqcQ-1; Mon, 13 Jan 2020 02:19:41 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D81A5800D41;
 Mon, 13 Jan 2020 07:19:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82E5A60C05;
 Mon, 13 Jan 2020 07:19:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B9C1C784F; Mon, 13 Jan 2020 08:19:39 +0100 (CET)
Date: Mon, 13 Jan 2020 08:19:39 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: bochs_hw_init fails to request framebuffer on EFI boot with
 plymouth visible
Message-ID: <20200113071939.rtqb7yw45zi63fqy@sirius.home.kraxel.org>
References: <20200110163211.GB29736@mail-itl>
MIME-Version: 1.0
In-Reply-To: <20200110163211.GB29736@mail-itl>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 3jzgFbShNPmTQcsKWGpqcQ-1
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, Jan 10, 2020 at 05:32:11PM +0100, Marek Marczykowski-G=F3recki wrot=
e:
> Hi,
> =

> This is the context of "bochs_drm: failed bochs_hw_init() results in
> panic". When I boot the system, if plymouth is visible, it crashes. But
> if I press ESC to hide it, it boots fine. bochs_drm is build as module
> and _not_ included in the initramfs, so it is loaded only after root
> filesystem is mounted. And before that, efifb works just fine, including
> nice graphical disk passphrase prompt.

> [   32.951345] fb0: switching to bochsdrmfb from EFI VGA
[ ... ]
> [   33.030158] bochs-drm 0000:00:02.0: BAR 0: can't reserve [mem 0xc00000=
00-0xc0ffffff pref]

Looks like efifb continues to claim the framebuffer resource
(0xc0000000-0xc0ffffff) for some reason, so bochs-drm can't
reserve it.

No clue why, also doesn't reproduce here (standard fedora 31 5.4.7
kernel).  I don't have an encrypted disk, so no passphrase prompt,
maybe that makes a difference.

How does /proc/iomem look after boot, specifically the 0000:00:02.0 pci
bars?

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
