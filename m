Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 325A2B4914
	for <lists.virtualization@lfdr.de>; Tue, 17 Sep 2019 10:18:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E3B4A1146;
	Tue, 17 Sep 2019 08:18:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 394FB1146
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 08:18:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DF4F076D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 08:18:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2391315C00D;
	Tue, 17 Sep 2019 08:18:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
	[10.36.116.47])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C14D5D9DC;
	Tue, 17 Sep 2019 08:18:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 9D29217444; Tue, 17 Sep 2019 10:18:18 +0200 (CEST)
Date: Tue, 17 Sep 2019 10:18:18 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/8] drm/shmem: drop DEFINE_DRM_GEM_SHMEM_FOPS
Message-ID: <20190917081818.4lumcpn4wf6jcuyt@sirius.home.kraxel.org>
References: <20190913122908.784-1-kraxel@redhat.com>
	<20190913122908.784-4-kraxel@redhat.com>
	<CAL_JsqJajCtM=vRgSDX2DQ6iJzDgMHicXgXgGqF7Bc-KdTUUQA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJajCtM=vRgSDX2DQ6iJzDgMHicXgXgGqF7Bc-KdTUUQA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 17 Sep 2019 08:18:20 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	open list <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Steven Price <steven.price@arm.com>, Hans de Goede <hdegoede@redhat.com>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
	"open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE"
	<virtualization@lists.linux-foundation.org>, Sean Paul <sean@poorly.run>
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

On Mon, Sep 16, 2019 at 05:07:14PM -0500, Rob Herring wrote:
> On Fri, Sep 13, 2019 at 7:29 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> 
> Version? Pretty sure this is not v1.

Yep, was posted as part of a longer series before.

Splitted the long series into multiple smaller ones by cherry-picking
patches into new branches, which re-started the numbering.

Sorry for the confusion,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
