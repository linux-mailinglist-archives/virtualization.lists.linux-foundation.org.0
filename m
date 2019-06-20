Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E07C4C706
	for <lists.virtualization@lfdr.de>; Thu, 20 Jun 2019 08:01:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 117F2C6E;
	Thu, 20 Jun 2019 06:01:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1F79BBA9
	for <virtualization@lists.linux-foundation.org>;
	Thu, 20 Jun 2019 06:01:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CBF79E6
	for <virtualization@lists.linux-foundation.org>;
	Thu, 20 Jun 2019 06:01:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7461AC18B2DC;
	Thu, 20 Jun 2019 06:01:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-212.ams2.redhat.com
	[10.36.116.212])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E81CE1001DDC;
	Thu, 20 Jun 2019 06:01:08 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 3E0AE1750A; Thu, 20 Jun 2019 08:01:07 +0200 (CEST)
Date: Thu, 20 Jun 2019 08:01:07 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <maxime.ripard@bootlin.com>,
	Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
	open list <linux-kernel@vger.kernel.org>, "open list:VIRTIO GPU DRIVER"
	<virtualization@lists.linux-foundation.org>
Subject: Re: [PATCH v3 08/12] drm/virtio: rework virtio_gpu_execbuffer_ioctl
	fencing
Message-ID: <20190620060107.tdz3nrnsczkkv2a6@sirius.home.kraxel.org>
References: <20190619090420.6667-1-kraxel@redhat.com>
	<20190619090420.6667-9-kraxel@redhat.com>
	<20190619110902.GO12905@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619110902.GO12905@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 20 Jun 2019 06:01:21 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

  Hi,

> Also, I strongly recommend you do a very basic igt to exercise this, i.e.
> allocate some buffers, submit them in a dummby op, then close the entire
> drmfd. The old version should at least have tripped over kasan, maybe even
> oopses somewhere.

Hmm, I suspect I have to extend igt for that (adding support for
virtio ioctls), right?

A quick and dirty test (run webgl demo in firefox, then kill -9 both
firefox and Xorg) didn't show any nasty surprises.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
