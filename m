Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EDBC99C3
	for <lists.virtualization@lfdr.de>; Thu,  3 Oct 2019 10:24:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 504031356;
	Thu,  3 Oct 2019 08:24:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4A28E11C2
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 08:24:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-163.sinamail.sina.com.cn (mail3-163.sinamail.sina.com.cn
	[202.108.3.163])
	by smtp1.linuxfoundation.org (Postfix) with SMTP id 6F9911FB
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 08:24:21 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([124.64.2.167])
	by sina.com with ESMTP
	id 5D95B00D0003713B; Thu, 3 Oct 2019 16:23:43 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 29860649283206
From: Hillf Danton <hdanton@sina.com>
To: Frediano Ziglio <fziglio@redhat.com>,
	Jaak Ristioja <jaak@ristioja.ee>
Subject: Re: [Spice-devel] Xorg indefinitely hangs in kernelspace
Date: Thu,  3 Oct 2019 16:23:30 +0800
Message-Id: <20191003082330.15260-1-hdanton@sina.com>
In-Reply-To: <1174991123.3693721.1569850187145.JavaMail.zimbra@redhat.com>
References: <92785039-0941-4626-610b-f4e3d9613069@ristioja.ee>
	<20190905071407.47iywqcqomizs3yr@sirius.home.kraxel.org>
	<e4b7d889-15f3-0c90-3b9f-d395344499c0@ristioja.ee>
	<ccafdbaf-7f8e-8616-5543-2a178bd63828@ristioja.ee>
	<1174991123.3693721.1569850187145.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
	Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
	spice-devel@lists.freedesktop.org
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


On Thu, 3 Oct 2019 09:45:55 +0300 Jaak Ristioja wrote:
> On 30.09.19 16:29, Frediano Ziglio wrote:
> >   Why didn't you update bug at https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1813620?
> > I know it can seem tedious but would help tracking it.
> 
> I suppose the lack on centralized tracking and handling of Linux kernel
> bugs is a delicate topic, so I don't want to rant much more on that.
> Updating that bug would tedious and time-consuming indeed, which is why
> I haven't done that. To be honest, I don't have enough time and motivation.

Give the diff below a go only when it is convenient and only if it makes
a bit of sense to you.

--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
@@ -110,6 +110,7 @@ int ttm_eu_reserve_buffers(struct ww_acq
 		ww_acquire_init(ticket, &reservation_ww_class);
 
 	list_for_each_entry(entry, list, head) {
+		bool lockon = false;
 		struct ttm_buffer_object *bo = entry->bo;
 
 		ret = __ttm_bo_reserve(bo, intr, (ticket == NULL), ticket);
@@ -150,6 +151,7 @@ int ttm_eu_reserve_buffers(struct ww_acq
 				dma_resv_lock_slow(bo->base.resv, ticket);
 				ret = 0;
 			}
+			lockon = !ret;
 		}
 
 		if (!ret && entry->num_shared)
@@ -157,6 +159,8 @@ int ttm_eu_reserve_buffers(struct ww_acq
 								entry->num_shared);
 
 		if (unlikely(ret != 0)) {
+			if (lockon)
+				dma_resv_unlock(bo->base.resv);
 			if (ret == -EINTR)
 				ret = -ERESTARTSYS;
 			if (ticket) {

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
