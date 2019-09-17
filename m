Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DE642B49AD
	for <lists.virtualization@lfdr.de>; Tue, 17 Sep 2019 10:39:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6EE3A1174;
	Tue, 17 Sep 2019 08:39:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 37ADF116A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 08:39:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DFCFE76D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 08:39:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 28DCDC058CA4;
	Tue, 17 Sep 2019 08:39:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
	[10.36.116.47])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6259A60BF7;
	Tue, 17 Sep 2019 08:39:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 4B5D816E05; Tue, 17 Sep 2019 10:39:02 +0200 (CEST)
Date: Tue, 17 Sep 2019 10:39:02 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 8/8] drm/vram: drop DRM_VRAM_MM_FILE_OPERATIONS
Message-ID: <20190917083902.fn32iznnjm3zhudl@sirius.home.kraxel.org>
References: <20190913122908.784-1-kraxel@redhat.com>
	<20190913122908.784-9-kraxel@redhat.com>
	<e9712055-c6db-5515-0c11-4d7add138856@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9712055-c6db-5515-0c11-4d7add138856@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 17 Sep 2019 08:39:04 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Maxime Ripard <maxime.ripard@bootlin.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
	"open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	Xinliang Liu <z.liuxinliang@hisilicon.com>,
	David Airlie <airlied@linux.ie>,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Chen Feng <puck.chen@hisilicon.com>, Rongrong Zou <zourongrong@gmail.com>,
	Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
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

> >  include/drm/drm_vram_mm_helper.h              | 82 +++++++++++++++++++

> > diff --git a/include/drm/drm_vram_mm_helper.h b/include/drm/drm_vram_mm_helper.h
> > new file mode 100644
> 
> Please rebase onto the latest drm-tip. This entire file has been removed
> in a recent patch.

I did rebase already, then re-added the file by mistake.  Didn't pay
enough attention while solving the conflict.  Fixed now.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
