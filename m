Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 762C9AD895
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 14:13:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4F41A1058;
	Mon,  9 Sep 2019 12:13:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A3F831024
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 12:13:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn
	[202.108.3.165])
	by smtp1.linuxfoundation.org (Postfix) with SMTP id 3AC4E81A
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 12:13:04 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([61.148.244.178])
	by sina.com with ESMTP
	id 5D7641CB0002754D; Mon, 9 Sep 2019 20:13:02 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 314662630154
From: Hillf Danton <hdanton@sina.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Jaak Ristioja <jaak@ristioja.ee>
Subject: Re: Xorg indefinitely hangs in kernelspace
Date: Mon,  9 Sep 2019 20:12:50 +0800
Message-Id: <20190909121250.11176-1-hdanton@sina.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
	Daniel Vetter <daniel@ffwll.ch>, spice-devel@lists.freedesktop.org,
	Dave Airlie <airlied@redhat.com>
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


On Mon, 9 Sep 2019 from Gerd Hoffmann <kraxel@redhat.com>
>
> Hmm, I think the patch is wrong.

Hmm...it should have added change only in the error path, leaving locks
for drivers to release if job is done with no error returned.

> As far I know it is the qxl drivers's
> job to call ttm_eu_backoff_reservation().

Like other drivers, qxl is currently doing the right.

> Doing that automatically in
> ttm will most likely break other ttm users.
>
You are right. They are responsible for doing backoff if error happens
while validating buffers afterwards.


--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
@@ -111,8 +111,10 @@ int ttm_eu_reserve_buffers(struct ww_acq
 
 	list_for_each_entry(entry, list, head) {
 		struct ttm_buffer_object *bo = entry->bo;
+		bool lockon;
 
 		ret = __ttm_bo_reserve(bo, intr, (ticket == NULL), ticket);
+		lockon = !ret;
 		if (!ret && unlikely(atomic_read(&bo->cpu_writers) > 0)) {
 			reservation_object_unlock(bo->resv);
 
@@ -151,6 +153,7 @@ int ttm_eu_reserve_buffers(struct ww_acq
 				ret = 0;
 			}
 		}
+		lockon = !ret;
 
 		if (!ret && entry->num_shared)
 			ret = reservation_object_reserve_shared(bo->resv,
@@ -163,6 +166,8 @@ int ttm_eu_reserve_buffers(struct ww_acq
 				ww_acquire_done(ticket);
 				ww_acquire_fini(ticket);
 			}
+			if (lockon)
+				ttm_eu_backoff_reservation_reverse(list, entry);
 			return ret;
 		}
 
--

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
