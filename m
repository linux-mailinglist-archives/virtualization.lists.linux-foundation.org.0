Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 396161C6BEC
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 10:38:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E8C4C88560;
	Wed,  6 May 2020 08:38:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0cpkb+MVX4K7; Wed,  6 May 2020 08:38:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5285288571;
	Wed,  6 May 2020 08:38:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A34FC0859;
	Wed,  6 May 2020 08:38:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8632EC0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 75AB186B11
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:38:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PomT2fw7s_L7
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:38:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 85C4486AB5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 08:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588754294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c+eJgg/zkz4zS/BPXZUC0rvuRWK7Cs0ZNQXjC8ebbiU=;
 b=VenDdTj7JmnFjiKovNYnpfZ+73raOCXZkqM9YyVqvhf3CkjdaIn9mfPRi+XwABoImBFPHb
 tyII58vEsqlv9dOk5WBXF1cf8M3grU0ryDV92SEPZbc/lzsVzcpQtos+eNyslleeeFiW5Q
 xBO8N1n4C4OY+8e6cimYTyYDgvOY3aA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-HeCLntpdMIC6iS_s-5Rckg-1; Wed, 06 May 2020 04:38:08 -0400
X-MC-Unique: HeCLntpdMIC6iS_s-5Rckg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C1C3468;
 Wed,  6 May 2020 08:38:07 +0000 (UTC)
Received: from carbon (unknown [10.40.208.15])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACBFF1001B07;
 Wed,  6 May 2020 08:37:58 +0000 (UTC)
Date: Wed, 6 May 2020 10:37:57 +0200
From: Jesper Dangaard Brouer <brouer@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: performance bug in virtio net xdp
Message-ID: <20200506103757.4bc78b3a@carbon>
In-Reply-To: <20200506035704-mutt-send-email-mst@kernel.org>
References: <20200506035704-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Eugenio Perez Martin <eperezma@redhat.com>, brouer@redhat.com,
 bpf@vger.kernel.org
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

On Wed, 6 May 2020 04:08:27 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> So for mergeable bufs, we use ewma machinery to guess the correct buffer
> size. If we don't guess correctly, XDP has to do aggressive copies.
> 
> Problem is, xdp paths do not update the ewma at all, except
> sometimes with XDP_PASS. So whatever we happen to have
> before we attach XDP, will mostly stay around.
> 
> The fix is probably to update ewma unconditionally.

I personally find the code hard to follow, and (I admit) that it took
me some time to understand this code path (so I might still be wrong).

In patch[1] I tried to explain (my understanding):

  In receive_mergeable() the frame size is more dynamic. There are two
  basic cases: (1) buffer size is based on a exponentially weighted
  moving average (see DECLARE_EWMA) of packet length. Or (2) in case
  virtnet_get_headroom() have any headroom then buffer size is
  PAGE_SIZE. The ctx pointer is this time used for encoding two values;
  the buffer len "truesize" and headroom. In case (1) if the rx buffer
  size is underestimated, the packet will have been split over more
  buffers (num_buf info in virtio_net_hdr_mrg_rxbuf placed in top of
  buffer area). If that happens the XDP path does a xdp_linearize_page
  operation.


The EWMA code is not used when headroom is defined, which e.g. gets
enabled when running XDP.


[1] https://lore.kernel.org/netdev/158824572816.2172139.1358700000273697123.stgit@firesoul/
-- 
Best regards,
  Jesper Dangaard Brouer
  MSc.CS, Principal Kernel Engineer at Red Hat
  LinkedIn: http://www.linkedin.com/in/brouer

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
