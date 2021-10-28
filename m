Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A08143D90C
	for <lists.virtualization@lfdr.de>; Thu, 28 Oct 2021 03:59:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 816F7405A1;
	Thu, 28 Oct 2021 01:59:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G3qJgXQiHRmi; Thu, 28 Oct 2021 01:59:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5B9934054E;
	Thu, 28 Oct 2021 01:59:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3E57C0036;
	Thu, 28 Oct 2021 01:59:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5048EC000E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 01:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37FB240518
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 01:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MgAeFWT66ZJy
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 01:59:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B380640485
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 01:59:18 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=6; SR=0; TI=SMTPD_---0Utx0X9O_1635386354; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Utx0X9O_1635386354) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 28 Oct 2021 09:59:14 +0800
MIME-Version: 1.0
message-id: <1635386220.8124611-1-xuanzhuo@linux.alibaba.com>
subject: Re: [PATCH 3/3] virtio-net: enable virtio indirect cache
date: Thu, 28 Oct 2021 09:57:00 +0800
from: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
to: Jakub Kicinski <kuba@kernel.org>
in-reply-to: <20211027085528.01c4b313@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Cc: netdev@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 "David S. Miller" <davem@davemloft.net>,
 virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Wed, 27 Oct 2021 08:55:28 -0700, Jakub Kicinski <kuba@kernel.org> wrote:
> On Wed, 27 Oct 2021 14:19:13 +0800 Xuan Zhuo wrote:
> > +static bool virtio_desc_cache = true;
> >  module_param(csum, bool, 0444);
> >  module_param(gso, bool, 0444);
> >  module_param(napi_tx, bool, 0644);
> > +module_param(virtio_desc_cache, bool, 0644);
>
> Can this be an ethtool priv flag? module params are discouraged because
> they can't be controlled per-netdev.


The current design can only be set when the device is initialized. So using
ethtool to modify it will not work.

Thanks.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
