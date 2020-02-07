Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 474DE155288
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 07:46:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 830DB87D65;
	Fri,  7 Feb 2020 06:46:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrL-GEJ1ClvO; Fri,  7 Feb 2020 06:46:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1362387D5E;
	Fri,  7 Feb 2020 06:46:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EADD5C013E;
	Fri,  7 Feb 2020 06:46:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A81F4C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 06:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 90D55203BF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 06:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wPZNnmCoqpIs
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 06:46:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id BE150203B5
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 06:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581057995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JR0sLKJMwOjHuo0gNvxLVg3cMealajs17yiRzMpKjW0=;
 b=Kjd700Cb1INFpNO0XdGhC+ZaAQECB/rTUt0c5xjiIgn0b7/fSVrLQC7lFOVuLRv6NYX+hD
 r798BQq+TdNlJJ6JTSPXedEEHWTuxjUvSsmiGRHypmC2f7mZh+uc2Qeww8yjucA4wWhwy2
 A0Y1rDuB8quqlIOQfvDeayg0B/VxNgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-jrthkPVwN3SST0AZHHhljw-1; Fri, 07 Feb 2020 01:46:33 -0500
X-MC-Unique: jrthkPVwN3SST0AZHHhljw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F332E8010CA;
 Fri,  7 Feb 2020 06:46:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-112.ams2.redhat.com
 [10.36.116.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F0B45DA7C;
 Fri,  7 Feb 2020 06:46:31 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BCC461FCD6; Fri,  7 Feb 2020 07:46:30 +0100 (CET)
Date: Fri, 7 Feb 2020 07:46:30 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH] drm/virtio: fix ring free check
Message-ID: <20200207064630.6p35spqres676cpq@sirius.home.kraxel.org>
References: <20200206111416.31269-1-kraxel@redhat.com>
 <CAPaKu7Tfp-thov9xCe-Gbq1zZe_uvDAno8SV_3tc=tU0gse=uA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7Tfp-thov9xCe-Gbq1zZe_uvDAno8SV_3tc=tU0gse=uA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Gurchetan Singh <gurchetansingh@chromium.org>
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

> > +       indirect = virtio_has_feature(vgdev->vdev, VIRTIO_RING_F_INDIRECT_DESC);
> > +       vqcnt = indirect ? 1 : elemcnt;
> Is the feature dynamic and require the lock held?  If not, the result
> can be cached and the fixup can happen before grabbing the lock

Not dynamic, so yes, caching makes sense.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
