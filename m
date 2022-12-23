Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3019E654C67
	for <lists.virtualization@lfdr.de>; Fri, 23 Dec 2022 07:15:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48BC34168E;
	Fri, 23 Dec 2022 06:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48BC34168E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fEdUVAAySDWq; Fri, 23 Dec 2022 06:15:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E1D6140901;
	Fri, 23 Dec 2022 06:15:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1D6140901
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1758AC007C;
	Fri, 23 Dec 2022 06:15:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC0E8C0070
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Dec 2022 06:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B313B81F91
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Dec 2022 06:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B313B81F91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HdjQO6acNNQn
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Dec 2022 06:15:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 577B981F90
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 577B981F90
 for <virtualization@lists.linux-foundation.org>;
 Fri, 23 Dec 2022 06:15:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9FD8A6732D; Fri, 23 Dec 2022 07:15:08 +0100 (CET)
Date: Fri, 23 Dec 2022 07:15:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH] vdpa_sim: get rid of DMA ops
Message-ID: <20221223061508.GA3589@lst.de>
References: <20221223060021.28011-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221223060021.28011-1-jasowang@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: xieyongji@bytedance.com, mst@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com, hch@lst.de
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

Looks good from the DMA subsysten POV:

Acked-by: Christoph Hellwig <hch@lst.de>

Thanks for doing the work!
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
