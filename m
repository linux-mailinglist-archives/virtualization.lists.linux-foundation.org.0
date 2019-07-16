Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F07E56B018
	for <lists.virtualization@lfdr.de>; Tue, 16 Jul 2019 21:52:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 009B3D67;
	Tue, 16 Jul 2019 19:52:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 372B6D67
	for <virtualization@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 19:52:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0469E8A9
	for <virtualization@lists.linux-foundation.org>;
	Tue, 16 Jul 2019 19:52:40 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
	x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
	by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
	17351699-1500050 for multiple; Tue, 16 Jul 2019 20:52:32 +0100
MIME-Version: 1.0
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190716174331.7371-2-robdclark@gmail.com>
References: <20190716174331.7371-1-robdclark@gmail.com>
	<20190716174331.7371-2-robdclark@gmail.com>
Message-ID: <156330674940.9436.18083089508232951941@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v2 2/3] drm: plumb attaching dev thru to prime_pin/unpin
Date: Tue, 16 Jul 2019 20:52:29 +0100
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Eric Biggers <ebiggers@google.com>,
	Maxime Ripard <maxime.ripard@bootlin.com>,
	nouveau@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>,
	virtualization@lists.linux-foundation.org,
	Emil Velikov <emil.velikov@collabora.com>,
	Rob Clark <robdclark@chromium.org>,
	"David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
	amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
	Ben Skeggs <bskeggs@redhat.com>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Dave Airlie <airlied@redhat.com>, Laura Abbott <labbott@redhat.com>,
	Deepak Sharma <deepak.sharma@amd.com>,
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	etnaviv@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	spice-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
	linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
	=?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	Lucas Stach <l.stach@pengutronix.de>
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

Quoting Rob Clark (2019-07-16 18:43:22)
> From: Rob Clark <robdclark@chromium.org>
> 
> Needed in the following patch for cache operations.

What's the base for this patch? (I'm missing the ancestor for drm_gem.c)
-Chris
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
