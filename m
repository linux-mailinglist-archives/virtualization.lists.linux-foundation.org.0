Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3734B43D21B
	for <lists.virtualization@lfdr.de>; Wed, 27 Oct 2021 22:08:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3F9A404FC;
	Wed, 27 Oct 2021 20:08:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmyuVcjnCgKE; Wed, 27 Oct 2021 20:08:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 908B240517;
	Wed, 27 Oct 2021 20:08:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E3BBC000E;
	Wed, 27 Oct 2021 20:08:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27247C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 20:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED1924023E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 20:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D6STrPSk4Klb
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 20:08:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B55E4400FE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 20:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635365315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=VJyQQirrZwuNXLBhFZlxTeutqhrfo+TWoiIbs1ysy2s=;
 b=AUyKUHu1Rtv5sX5J2buxGUl5QHgZFsBvyDC7ZecjAZAmY0vCX7FjfuXgWGFR6y6gr/FxSP
 eYScXfNxn9jLADuJHwnbZK4Vp6FZZPNWDoOCx8AKBinorLxKqxv47gQyzYK4V9cFfX430s
 UiiQxcORdYraFc2V/mJiYcX76+vzvYw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-waHQg3O1O8WVxjn9XpmIWw-1; Wed, 27 Oct 2021 16:08:34 -0400
X-MC-Unique: waHQg3O1O8WVxjn9XpmIWw-1
Received: by mail-ed1-f71.google.com with SMTP id
 m16-20020a056402431000b003dd2005af01so3409675edc.5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 13:08:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=VJyQQirrZwuNXLBhFZlxTeutqhrfo+TWoiIbs1ysy2s=;
 b=F2JCz5upsH/cj7EQgpl8rFgHni5P/7YottvOdxkhohTSKROSg/umQP1EgVHwhZknWM
 vVV2DSmtA/09bBtcxApgZq/C/A08e1X0rcVpqPBsJnin4Ll6Z0hzAFyzoRodpLX1uEoa
 /jHfpunoAp6HThuo3tSGCplxLeWHXeZZOcFHmiCGexwTAD79uzx3lBJBwnesBjk6LFFo
 WsY96v1GKw6qLo525Fwy+wlOYc7/q9lnbfOxHsVKGmTZ9JlDNRYe8r39teCDRKieh70S
 CABG2z/SPVq0JNy1CH5/WmEZPdCbQnDJxDWCW2NrPxex1hFcHlJzI/2/uKKS06LWyRCL
 0Kew==
X-Gm-Message-State: AOAM533biQA7+6JADrDpHuXycHYSKECLdpmG6Vc53TgcKLHeT75eluq1
 dKGolbQ0xY7PXNaLqK6jBDko1NXQHJWlyJ5sTh9WWX7S+zB4LtafgvC4BIoa4+/W0pQIJYmnRPR
 Tr2o+nooQ4aix/v9BXQCQwX0nibjn9Xwo9Shr4LmLnQ==
X-Received: by 2002:a17:906:c18d:: with SMTP id
 g13mr40156607ejz.518.1635365312936; 
 Wed, 27 Oct 2021 13:08:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpFHN76pLgh4LdmFOeHgtbBOiaO/TarBKKy+bAQpZOaQQRa5m1hagk9YBfjHLP3LAg3Zp+BQ==
X-Received: by 2002:a17:906:c18d:: with SMTP id
 g13mr40156577ejz.518.1635365312743; 
 Wed, 27 Oct 2021 13:08:32 -0700 (PDT)
Received: from redhat.com ([2.55.137.59])
 by smtp.gmail.com with ESMTPSA id u9sm253017edf.47.2021.10.27.13.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 13:08:32 -0700 (PDT)
Date: Wed, 27 Oct 2021 16:08:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] virtio: last minute fixes
Message-ID: <20211027160829-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 vincent.whitchurch@axis.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xieyongji@bytedance.com
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

The following changes since commit 64222515138e43da1fcf288f0289ef1020427b87:

  Merge tag 'drm-fixes-2021-10-22' of git://anongit.freedesktop.org/drm/drm (2021-10-21 19:06:08 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to 890d33561337ffeba0d8ba42517e71288cfee2b6:

  virtio-ring: fix DMA metadata flags (2021-10-27 15:54:34 -0400)

----------------------------------------------------------------
virtio: last minute fixes

A couple of fixes that seem important enough to pick at the last moment.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Vincent Whitchurch (1):
      virtio-ring: fix DMA metadata flags

Xie Yongji (2):
      vduse: Disallow injecting interrupt before DRIVER_OK is set
      vduse: Fix race condition between resetting and irq injecting

 drivers/vdpa/vdpa_user/vduse_dev.c | 29 +++++++++++++++++++++++++----
 drivers/virtio/virtio_ring.c       |  2 +-
 2 files changed, 26 insertions(+), 5 deletions(-)

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
