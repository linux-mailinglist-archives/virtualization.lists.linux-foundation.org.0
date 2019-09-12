Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B574B0EF4
	for <lists.virtualization@lfdr.de>; Thu, 12 Sep 2019 14:38:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C307EDD9;
	Thu, 12 Sep 2019 12:38:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E62DADBE
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 12:38:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A29F48AA
	for <virtualization@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 12:38:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4BD710C092C;
	Thu, 12 Sep 2019 12:38:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
	[10.36.116.47])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7EE9360872;
	Thu, 12 Sep 2019 12:38:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id B502E16E05; Thu, 12 Sep 2019 14:38:21 +0200 (CEST)
Date: Thu, 12 Sep 2019 14:38:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [RFC PATCH] drm/virtio: Export resource handles via DMA-buf API
Message-ID: <20190912123821.rraib5entkcxt5p5@sirius.home.kraxel.org>
References: <20190912094121.228435-1-tfiga@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190912094121.228435-1-tfiga@chromium.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.66]);
	Thu, 12 Sep 2019 12:38:23 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: zachr@chromium.org, David Airlie <airlied@linux.ie>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, keiichiw@chromium.org,
	stevensd@chromium.org, Daniel Vetter <daniel@ffwll.ch>,
	marcheu@chromium.org, posciak@chromium.org
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

> To seamlessly enable buffer sharing with drivers using such frameworks,
> make the virtio-gpu driver expose the resource handle as the DMA address
> of the buffer returned from the DMA-buf mapping operation.  Arguably, the
> resource handle is a kind of DMA address already, as it is the buffer
> identifier that the device needs to access the backing memory, which is
> exactly the same role a DMA address provides for native devices.

No.  A scatter list has guest dma addresses, period.  Stuffing something
else into a scatterlist is asking for trouble, things will go seriously
wrong when someone tries to use such a fake scatterlist as real scatterlist.

Also note that "the DMA address of the buffer" is bonkers in virtio-gpu
context.  virtio-gpu resources are not required to be physically
contigous in memory, so typically you actually need a scatter list to
describe them.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
