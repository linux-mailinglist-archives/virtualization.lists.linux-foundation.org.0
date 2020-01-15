Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC0113BD13
	for <lists.virtualization@lfdr.de>; Wed, 15 Jan 2020 11:08:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7639686156;
	Wed, 15 Jan 2020 10:08:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8+snpsFi3w7N; Wed, 15 Jan 2020 10:08:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C36E68627B;
	Wed, 15 Jan 2020 10:08:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9271DC077D;
	Wed, 15 Jan 2020 10:08:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49A34C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 10:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 30A3B85DDB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 10:08:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J-PqYyfOB876
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 10:08:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A38E385D8D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 10:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579082908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YfnsmArqxTkBj+NZqWcKs0G8KWCYL3+xdV18qq2mHlg=;
 b=WZcSBd59SStws8AICiXiDoP4GJdNMyAPjCgcrl6N9Aaptr4VwGtKO0bEQLrCBk9ThmzbBi
 CnBTpMmCQEumNlAmwENl/5zvbmCBXF/Q+3zrHgDWNBdC8jNOFqjHuqEjZ7bKQu935C4e89
 qmRirXswp3zlW/5Ut6DxE6bqrgE/AZw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-pWTTxJawNnykOnotd6CZ-Q-1; Wed, 15 Jan 2020 05:08:25 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 178E510A9F27;
 Wed, 15 Jan 2020 10:08:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CACFA60BE0;
 Wed, 15 Jan 2020 10:08:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D9A51784F; Wed, 15 Jan 2020 11:08:21 +0100 (CET)
Date: Wed, 15 Jan 2020 11:08:21 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: bochs_hw_init fails to request framebuffer on EFI boot with
 plymouth visible
Message-ID: <20200115100821.qcdraolkoki6e5tz@sirius.home.kraxel.org>
References: <20200110163211.GB29736@mail-itl>
 <20200113071939.rtqb7yw45zi63fqy@sirius.home.kraxel.org>
 <20200115003356.GL2507@mail-itl>
MIME-Version: 1.0
In-Reply-To: <20200115003356.GL2507@mail-itl>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: pWTTxJawNnykOnotd6CZ-Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

  Hi,

> > No clue why, also doesn't reproduce here (standard fedora 31 5.4.7
> > kernel).  I don't have an encrypted disk, so no passphrase prompt,
> > maybe that makes a difference.
> 
> Extra data point: it worked on 4.19.89.
> 
> > How does /proc/iomem look after boot, specifically the 0000:00:02.0 pci
> > bars?
> 
> grep 0000:00:02.0 /proc/iomem
>   c0000000-c0ffffff : 0000:00:02.0
>   c1087000-c1087fff : 0000:00:02.0

And "grep -A1 0000:00:02.0 /proc/iomem" ?

Also: what happens if you "rmmod bochs-drm; modprobe bochs-drm"?

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
