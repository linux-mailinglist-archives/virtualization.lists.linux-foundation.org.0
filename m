Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAF06D1963
	for <lists.virtualization@lfdr.de>; Fri, 31 Mar 2023 10:07:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8977341F94;
	Fri, 31 Mar 2023 08:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8977341F94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m1hgaPOaZv2S; Fri, 31 Mar 2023 08:07:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 15D8142170;
	Fri, 31 Mar 2023 08:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15D8142170
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47FA9C007E;
	Fri, 31 Mar 2023 08:07:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4C6BC002F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Mar 2023 08:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A8C160F23
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Mar 2023 08:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A8C160F23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CNS1BQqOmpY7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Mar 2023 08:07:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E3F960BDD
Received: from out30-118.freemail.mail.aliyun.com
 (out30-118.freemail.mail.aliyun.com [115.124.30.118])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E3F960BDD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 31 Mar 2023 08:07:30 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R731e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045176;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0Vf1OpCK_1680250045; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vf1OpCK_1680250045) by smtp.aliyun-inc.com;
 Fri, 31 Mar 2023 16:07:26 +0800
Message-ID: <1680250036.1570807-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH] vringh: fix typos in the vringh_init_* documentation
Date: Fri, 31 Mar 2023 16:07:16 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20230331080208.17002-1-sgarzare@redhat.com>
In-Reply-To: <20230331080208.17002-1-sgarzare@redhat.com>
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Simon Horman <simon.horman@corigine.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, 31 Mar 2023 10:02:08 +0200, Stefano Garzarella <sgarzare@redhat.com> wrote:
> Replace `userpace` with `userspace`.
>
> Cc: Simon Horman <simon.horman@corigine.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Thanks

> ---
>  drivers/vhost/vringh.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
> index a1e27da54481..694462ba3242 100644
> --- a/drivers/vhost/vringh.c
> +++ b/drivers/vhost/vringh.c
> @@ -636,9 +636,9 @@ static inline int xfer_to_user(const struct vringh *vrh,
>   * @features: the feature bits for this ring.
>   * @num: the number of elements.
>   * @weak_barriers: true if we only need memory barriers, not I/O.
> - * @desc: the userpace descriptor pointer.
> - * @avail: the userpace avail pointer.
> - * @used: the userpace used pointer.
> + * @desc: the userspace descriptor pointer.
> + * @avail: the userspace avail pointer.
> + * @used: the userspace used pointer.
>   *
>   * Returns an error if num is invalid: you should check pointers
>   * yourself!
> @@ -911,9 +911,9 @@ static inline int kern_xfer(const struct vringh *vrh, void *dst,
>   * @features: the feature bits for this ring.
>   * @num: the number of elements.
>   * @weak_barriers: true if we only need memory barriers, not I/O.
> - * @desc: the userpace descriptor pointer.
> - * @avail: the userpace avail pointer.
> - * @used: the userpace used pointer.
> + * @desc: the userspace descriptor pointer.
> + * @avail: the userspace avail pointer.
> + * @used: the userspace used pointer.
>   *
>   * Returns an error if num is invalid.
>   */
> @@ -1306,9 +1306,9 @@ static inline int putused_iotlb(const struct vringh *vrh,
>   * @features: the feature bits for this ring.
>   * @num: the number of elements.
>   * @weak_barriers: true if we only need memory barriers, not I/O.
> - * @desc: the userpace descriptor pointer.
> - * @avail: the userpace avail pointer.
> - * @used: the userpace used pointer.
> + * @desc: the userspace descriptor pointer.
> + * @avail: the userspace avail pointer.
> + * @used: the userspace used pointer.
>   *
>   * Returns an error if num is invalid.
>   */
> --
> 2.39.2
>
> _______________________________________________
> Virtualization mailing list
> Virtualization@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/virtualization
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
