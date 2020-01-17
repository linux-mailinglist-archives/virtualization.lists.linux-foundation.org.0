Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6F7140A4C
	for <lists.virtualization@lfdr.de>; Fri, 17 Jan 2020 13:58:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3F27986A14;
	Fri, 17 Jan 2020 12:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qxvaLFKPO99C; Fri, 17 Jan 2020 12:58:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A6098869E6;
	Fri, 17 Jan 2020 12:58:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B152C077D;
	Fri, 17 Jan 2020 12:58:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6932AC077D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 12:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 51C332002E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 12:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uv8cQ0UGv35H
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 12:58:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id E5E2720480
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 12:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579265908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qfthL1SsPnLEwczD9Xo/btfcDSS+QgNuW4ze0HrRzfs=;
 b=BzybHady5JIwtshkXLs6h4u4VBeFyw3tuTGb2QqBcj5RsOPjYhjjW4sVG5hbucyaPXn96H
 vOpMyjBuKFuXXfkImluHTn7qDXsERWpVkJAyO7Rvo+Zs5oDinWIi+YytqQO/ogSIYreuYy
 41msYfmQzwb2t7UQhUcDk9Xy3F/Qfqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-gTSZ9602P4-VcAQgwVPkEQ-1; Fri, 17 Jan 2020 07:58:27 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1493C8005A0;
 Fri, 17 Jan 2020 12:58:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-106.ams2.redhat.com
 [10.36.116.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C688D10016EB;
 Fri, 17 Jan 2020 12:58:25 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 080E816E18; Fri, 17 Jan 2020 13:58:25 +0100 (CET)
Date: Fri, 17 Jan 2020 13:58:25 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: bochs_hw_init fails to request framebuffer on EFI boot with
 plymouth visible
Message-ID: <20200117125825.3in2t2m6nxbblsaf@sirius.home.kraxel.org>
References: <20200110163211.GB29736@mail-itl>
 <20200113071939.rtqb7yw45zi63fqy@sirius.home.kraxel.org>
 <20200115003356.GL2507@mail-itl>
 <20200115100821.qcdraolkoki6e5tz@sirius.home.kraxel.org>
 <20200115134119.GP1314@mail-itl>
 <20200115141353.3kse3uj2mg6ik6k5@sirius.home.kraxel.org>
 <20200115142741.GM2507@mail-itl>
 <20200115161635.ekrnk5rmjqbxxu77@sirius.home.kraxel.org>
 <20200116025232.GN2507@mail-itl>
MIME-Version: 1.0
In-Reply-To: <20200116025232.GN2507@mail-itl>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: gTSZ9602P4-VcAQgwVPkEQ-1
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

> Should switching to bochsdrmfb be deferred until efifb gets properly
> destroyed? How?

Should be in do_remove_conflicting_framebuffers, everyone might run into
this.  So lets try wait for all (other) references went away:

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index d04554959ea7..2d4911cc7ec4 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1726,7 +1726,9 @@ static void do_unregister_framebuffer(struct fb_info *fb_info)
 	fbcon_fb_unregistered(fb_info);
 	console_unlock();
 
-	/* this may free fb info */
+	while (atomic_read(&fb_info->count) > 1)
+		msleep(10);
+	/* this will free fb info */
 	put_fb_info(fb_info);
 }
 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
