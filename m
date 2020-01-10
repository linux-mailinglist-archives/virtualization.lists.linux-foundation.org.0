Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BEA1366C4
	for <lists.virtualization@lfdr.de>; Fri, 10 Jan 2020 06:36:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 971C1203FC;
	Fri, 10 Jan 2020 05:36:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iUXBjK4528PG; Fri, 10 Jan 2020 05:36:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9FC3720400;
	Fri, 10 Jan 2020 05:36:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E67FC1D7D;
	Fri, 10 Jan 2020 05:36:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B0AAC0881
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 05:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 837F4869A5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 05:36:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxwtj-G9EU99
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 05:36:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C2F5086360
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 05:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578634599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HM5UsrVrUU/xsuvpVm4/UMVX73v4Pg7qa9yYLhBJ6yc=;
 b=TKUy/09gCU70Qzg9Rv9hYE81Asg5ajM7diX9sshg5Q1c6wR2awLZrzyW0sVKphGx//Wv4O
 JHRDJjV8j1T4e0V5Y02HJl1S6HSQmX5uI4QBWpDD5qpbRmwb/Td+0IHL9JP3CvnM5VXHA7
 6gQZCa316Zx4Yxocpolpb3hk6BjPqvI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-HAiFoP4dN6mOpOKAAZbPiw-1; Fri, 10 Jan 2020 00:35:55 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDA0A800A02;
 Fri, 10 Jan 2020 05:35:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-98.ams2.redhat.com
 [10.36.116.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C9F5272C4;
 Fri, 10 Jan 2020 05:35:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BE07B9DA5; Fri, 10 Jan 2020 06:35:53 +0100 (CET)
Date: Fri, 10 Jan 2020 06:35:53 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: Re: bochs_drm: failed bochs_hw_init() results in panic
Message-ID: <20200110053553.4gqlagjdpfi6pg3b@sirius.home.kraxel.org>
References: <20200110013328.GA12596@mail-itl>
MIME-Version: 1.0
In-Reply-To: <20200110013328.GA12596@mail-itl>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: HAiFoP4dN6mOpOKAAZbPiw-1
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

On Fri, Jan 10, 2020 at 02:33:28AM +0100, Marek Marczykowski-G=F3recki wrot=
e:
> Hi,
> =

> It looks like bochs_kms_fini() don't like being called if
> bochs_kms_init() wasn't. Regardless of the reason for the
> bochs_hw_init() failure (that's another story), it shouldn't cause a
> panic. Any idea how to fix it?

maybe this?

diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/boch=
s_kms.c
index 3f0006c2470d..322be68a238a 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -192,6 +192,9 @@ int bochs_kms_init(struct bochs_device *bochs)
 =

 void bochs_kms_fini(struct bochs_device *bochs)
 {
+	if (!dev->mode_config.num_connector)
+		return;
+
 	drm_atomic_helper_shutdown(bochs->dev);
 	drm_mode_config_cleanup(bochs->dev);
 }

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
