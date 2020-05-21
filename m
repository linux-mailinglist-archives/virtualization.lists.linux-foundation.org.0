Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA2A1DD5B0
	for <lists.virtualization@lfdr.de>; Thu, 21 May 2020 20:08:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E8C81203E8;
	Thu, 21 May 2020 18:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dFX8tFyFXIEV; Thu, 21 May 2020 18:08:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A479920418;
	Thu, 21 May 2020 18:08:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77DF5C0176;
	Thu, 21 May 2020 18:08:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DDD03C0176
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 May 2020 18:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C5D8F87376
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 May 2020 18:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZbyLRT_bvaA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 May 2020 18:08:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 20C2E87375
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 May 2020 18:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590084524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=CSwVUGMdm1SF/JKvVgrgcJwpikT7dcnsVODRPnenSIQ=;
 b=AwaSGcsE7chVA8hMIziG7fqggYULAnw5C+/8wc4ozWIMOrCSmlOQxM8hW3fBzoNxHtUQFk
 HgT1+YRKn3ZJFgAhhwzW1tvN0kIYNc9n4gMYwas2wYFNHjlBLWuiWdumx9p1kdkT43jeg2
 1ZuAHCDko7riyCWMjUB0L/kef77eRJI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-_mDPuHxRNbyAwiR99NEpPw-1; Thu, 21 May 2020 14:08:40 -0400
X-MC-Unique: _mDPuHxRNbyAwiR99NEpPw-1
Received: by mail-wr1-f70.google.com with SMTP id p13so3249755wrt.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 21 May 2020 11:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=CSwVUGMdm1SF/JKvVgrgcJwpikT7dcnsVODRPnenSIQ=;
 b=mLgVaHinpzf/jr1lgTKj9LVdqDX/J8VHCfRbAQn8oxOxW631jqJNcieTurZxEpevn4
 RqIH3tYe95pJBqZuO3XZIXFBEWuW0Z7JUeyCMhyaPoMMCAuP3V1+0aIb1Im1m41EhAyh
 gqdrEFlCLXUBjeuCaOE9DQj6JIhngmle4U1yTWKDw0XObNsNuNVsq9ki9YpxYO0qAyRh
 knQyorJpteyNzoouu0Q8e/YvgCP8lcnrsul97voIp4LxIQUbmo2r3veekYXa3l8PMRf+
 5CSgYT8rHwdsU5wbb5XRiL7iP5hMpijTaQOJGvP7lUd86av5gNmqlh7GkXBSWQI2gdic
 hvkQ==
X-Gm-Message-State: AOAM533B1+4Fbyv66HVdjsPINXmR0M9MgnTLBiGInuSadHHO8N+sZKsx
 Qte2zbHWTPn0OZFAkFO2d9R/JQKtm4L0Ra80uHUg0WDwPfvmq7+PyvEK53tcsSL756P0ggn3XDD
 +cZolU5MgcqEYE3Stx5rc5BVbHSHQ03jN20dJFh1HwQ==
X-Received: by 2002:a5d:6087:: with SMTP id w7mr10437014wrt.158.1590084518725; 
 Thu, 21 May 2020 11:08:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ9o08gBH7tx0yYBsN8onaJW/OLPfFqqFDCwm2ORoSsfevxSpfrqifuC4Sj9PcOKKkhR/Jqg==
X-Received: by 2002:a5d:6087:: with SMTP id w7mr10436991wrt.158.1590084518323; 
 Thu, 21 May 2020 11:08:38 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 j1sm7269700wrm.40.2020.05.21.11.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 11:08:37 -0700 (PDT)
Date: Thu, 21 May 2020 14:08:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] vhost/vdpa: minor fixes
Message-ID: <20200521140835-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: lkp@intel.com, kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 yuehaibing@huawei.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

The following changes since commit 0b841030625cde5f784dd62aec72d6a766faae70:

  vhost: vsock: kick send_pkt worker once device is started (2020-05-02 10:28:21 -0400)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to 1b0be99f1a426d9f17ced95c4118c6641a2ff13d:

  vhost: missing __user tags (2020-05-15 11:36:31 -0400)

----------------------------------------------------------------
virtio: build warning fixes

Fix a couple of build warnings.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Michael S. Tsirkin (1):
      vhost: missing __user tags

YueHaibing (1):
      vdpasim: remove unused variable 'ret'

 drivers/vdpa/vdpa_sim/vdpa_sim.c | 15 +++++++--------
 drivers/vhost/vhost.c            |  4 ++--
 2 files changed, 9 insertions(+), 10 deletions(-)

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
