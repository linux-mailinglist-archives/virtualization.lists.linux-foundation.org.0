Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E043FAD2DB
	for <lists.virtualization@lfdr.de>; Mon,  9 Sep 2019 07:52:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C5255CAD;
	Mon,  9 Sep 2019 05:52:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C8511CAD
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 05:52:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 733007DB
	for <virtualization@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 05:52:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B5F7330A00C5;
	Mon,  9 Sep 2019 05:52:21 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-59.ams2.redhat.com
	[10.36.117.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD9E05D6A7;
	Mon,  9 Sep 2019 05:52:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id B9D2992F; Mon,  9 Sep 2019 07:52:19 +0200 (CEST)
Date: Mon, 9 Sep 2019 07:52:19 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Hillf Danton <hdanton@sina.com>
Subject: Re: Xorg indefinitely hangs in kernelspace
Message-ID: <20190909055219.q44k27cczwkuio3z@sirius.home.kraxel.org>
References: <20190906055322.17900-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906055322.17900-1-hdanton@sina.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 09 Sep 2019 05:52:21 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
	Daniel Vetter <daniel@ffwll.ch>, spice-devel@lists.freedesktop.org,
	Jaak Ristioja <jaak@ristioja.ee>, Dave Airlie <airlied@redhat.com>
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

--verbose please.  Do you see the same hang?  Does the patch fix it?

> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> @@ -97,8 +97,9 @@ int ttm_eu_reserve_buffers(struct ww_acq
>  			   struct list_head *dups, bool del_lru)
[ ... ]

> +			if (locked)
> +				ttm_eu_backoff_reservation_reverse(list, entry);

Hmm, I think the patch is wrong.  As far I know it is the qxl drivers's
job to call ttm_eu_backoff_reservation().  Doing that automatically in
ttm will most likely break other ttm users.

So I guess the call is missing in the qxl driver somewhere, most likely
in some error handling code path given that this bug is a relatively
rare event.

There is only a single ttm_eu_reserve_buffers() call in qxl.
So how about this?

----------------------- cut here --------------------
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 312216caeea2..2f9950fa0b8d 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -262,18 +262,20 @@ int qxl_release_reserve_list(struct qxl_release *release, bool no_intr)
 	ret = ttm_eu_reserve_buffers(&release->ticket, &release->bos,
 				     !no_intr, NULL, true);
 	if (ret)
-		return ret;
+		goto err_backoff;
 
 	list_for_each_entry(entry, &release->bos, tv.head) {
 		struct qxl_bo *bo = to_qxl_bo(entry->tv.bo);
 
 		ret = qxl_release_validate_bo(bo);
-		if (ret) {
-			ttm_eu_backoff_reservation(&release->ticket, &release->bos);
-			return ret;
-		}
+		if (ret)
+			goto err_backoff;
 	}
 	return 0;
+
+err_backoff:
+	ttm_eu_backoff_reservation(&release->ticket, &release->bos);
+	return ret;
 }
 
 void qxl_release_backoff_reserve_list(struct qxl_release *release)
----------------------- cut here --------------------

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
