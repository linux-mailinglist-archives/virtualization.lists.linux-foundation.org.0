Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 243EF14B09
	for <lists.virtualization@lfdr.de>; Mon,  6 May 2019 15:39:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4966A457F;
	Mon,  6 May 2019 13:39:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8875D4544
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 13:38:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3E902834
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 13:38:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BE633019898;
	Mon,  6 May 2019 13:38:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18E5B27091;
	Mon,  6 May 2019 13:38:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 412911747B; Mon,  6 May 2019 15:38:22 +0200 (CEST)
Date: Mon, 6 May 2019 15:38:22 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Robert Foss <robert.foss@collabora.com>
Subject: Re: [PATCH v2] drm/virtio: Remove redundant return type
Message-ID: <20190506133822.osgwr3rmqclyravf@sirius.home.kraxel.org>
References: <20190506091034.30289-1-robert.foss@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506091034.30289-1-robert.foss@collabora.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 06 May 2019 13:38:23 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, daniel@ffwll.ch,
	Chia-I Wu <olvaffe@gmail.com>, Emil Velikov <emil.velikov@collabora.com>
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

On Mon, May 06, 2019 at 11:10:34AM +0200, Robert Foss wrote:
> virtio_gpu_fence_emit() always returns 0, since it
> has no error paths.
> 
> Consequently no calls for virtio_gpu_fence_emit()
> use the return value, and it can be removed.
> 
> Signed-off-by: Robert Foss <robert.foss@collabora.com>
> Suggested-by: Emil Velikov <emil.velikov@collabora.com>
> Reviewed-by: Chia-I Wu <olvaffe@gmail.com>

Pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
