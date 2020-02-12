Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 583AD15A4EF
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 10:35:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 083AA85A7D;
	Wed, 12 Feb 2020 09:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YRB48CprAqN9; Wed, 12 Feb 2020 09:35:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A183C85A73;
	Wed, 12 Feb 2020 09:35:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83677C0177;
	Wed, 12 Feb 2020 09:35:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08C2CC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 09:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EA9F620386
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 09:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 04SIp3EFXlL5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 09:35:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 02E692001E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 09:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581500151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Co8sI2fabCgvVIAdRsnaywT6jDF6jkLMvIt7c5U+e2k=;
 b=HOsohDmKIpWVXo3nTz1n6nbguz1/epD8I/8KMiwh0nY0drVtNy236X+FzzHBhKMS5V9aCc
 2g2zNqUx5gBJv0QVvFxOMeO2Y4A+Z4JjeW8Oi4lj60oYzjtf5gijaroTXqHNKMZOFvW91D
 IpTMmVtVrRLNJZSDiVvxWmInjq2QSS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-KA2V6KLsMOaMd2oUQYkYQQ-1; Wed, 12 Feb 2020 04:35:45 -0500
X-MC-Unique: KA2V6KLsMOaMd2oUQYkYQQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC5C68017DF;
 Wed, 12 Feb 2020 09:35:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-39.ams2.redhat.com
 [10.36.117.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5ACBE60BF4;
 Wed, 12 Feb 2020 09:35:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 937FE9D6B; Wed, 12 Feb 2020 10:35:43 +0100 (CET)
Date: Wed, 12 Feb 2020 10:35:43 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org, olvaffe@gmail.com,
 gurchetansingh@chromium.org, David Airlie <airlied@linux.ie>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] drm/virtio: add drm_driver.release callback.
Message-ID: <20200212093543.qg4j2nk5wxlii7wr@sirius.home.kraxel.org>
References: <20200211135805.24436-1-kraxel@redhat.com>
 <20200211142711.GE2363188@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211142711.GE2363188@phenom.ffwll.local>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Tue, Feb 11, 2020 at 03:27:11PM +0100, Daniel Vetter wrote:
> On Tue, Feb 11, 2020 at 02:58:04PM +0100, Gerd Hoffmann wrote:
> > Split virtio_gpu_deinit(), move the drm shutdown and release to
> > virtio_gpu_release().  Drop vqs_ready variable, instead use
> > drm_dev_{enter,exit,unplug} to avoid touching hardware after
> > device removal.  Tidy up here and there.
> > 
> > v4: add changelog.
> > v3: use drm_dev_*().
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> Looks reasonable I think.
> 
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> I didn't review whether you need more drm_dev_enter/exit pairs, virtio is
> a bit more complex for that and I have no idea how exactly it works.

virtio uses two rings to send commands to the device, one to move the
cursor and one for everything else.  So pretty much everything ends up
calling either this ...

> > @@ -330,7 +330,14 @@ static void virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,

... or this ...

> > @@ -460,12 +460,13 @@ static void virtio_gpu_queue_cursor(struct virtio_gpu_device *vgdev,

... to submit some request to the (virtual) hardware.  Therefore we
don't need many drm_dev_enter/exit pairs to cover everything ;)

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
