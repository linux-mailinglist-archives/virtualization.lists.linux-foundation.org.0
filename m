Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F4B1C6FBD
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 13:57:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4A31E24F0C;
	Wed,  6 May 2020 11:57:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fOpyrZwHXLNx; Wed,  6 May 2020 11:57:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 12542204EB;
	Wed,  6 May 2020 11:57:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E52D2C088F;
	Wed,  6 May 2020 11:57:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02ED1C0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 11:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E536F85FD4
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 11:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d8hKB1nD4aOG
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 11:57:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7080485FAD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 11:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588766244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7sOis2/3Mg9JApCu6b61p44e2yvITngtwxXPAS7QTXw=;
 b=eOECMT1O55ojYyvkPnG/ApCaIY+6d6aU69hHPbqssAJEGjHzqfrB9w5s2la7vRRJSKGeWd
 lWlSvhQKFOm4t2UtClIkrOl4T02IF/L/PrYZlXSnMTQvYBzC6k6+Y2QMPdSs7YCCG4oSjF
 a44Csh0b+wGOjl8oKIsVh3U0OP7/7Nw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-xTHS1AurPIORIDcH6UsY2A-1; Wed, 06 May 2020 07:57:15 -0400
X-MC-Unique: xTHS1AurPIORIDcH6UsY2A-1
Received: by mail-wr1-f70.google.com with SMTP id z5so1173460wrt.17
 for <virtualization@lists.linux-foundation.org>;
 Wed, 06 May 2020 04:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7sOis2/3Mg9JApCu6b61p44e2yvITngtwxXPAS7QTXw=;
 b=hGshqokNqy6wBhTlvA2GP/wBW75DsI14jezFEfqVShgk2E49LvKdQ9x2mUvJjM4zj4
 IVKb6KdM8hSxR2f033o4YwTVo63iTv8fYPsCapzQQJEO3woi4omer0PJF7iiiiK+EB3D
 r3TleuE6y5DVn+liey+gxmdc30xQ9LTsVokz3SkaBkKLfo1usku0FeUMJJ2SqKf56ID9
 Ori28m5ytgq4Graaen/N7FYSFn5adHn1FGbN9FaOxlj1GfrQx68fBvTPYipE1iceU5BR
 iiR4pKcH29FGV5V3wVA5RlxQM6HdY7cBWlaoVMXJDZnFOEyQr0+bsBGX91wOW9xHWgCu
 32IA==
X-Gm-Message-State: AGi0PubNCXo63dZVV8H/Dj1DH1yKv/MeiMMaQnIAG1NAZqKLqAhUxb+X
 cvDS+PzHEgUCoP5xQXFl4PqOOcwer0m4hhOq4P+IU8B9UECKxy70LpvzTI+IpIhd9NpNL4hEVmf
 vBYH1yTS/5yd/12BYSvVuuXee9+JecTTAk9QIly7/Qg==
X-Received: by 2002:adf:8162:: with SMTP id 89mr8736335wrm.387.1588766233798; 
 Wed, 06 May 2020 04:57:13 -0700 (PDT)
X-Google-Smtp-Source: APiQypKH40QoEgrQmuxv8rKi91gxvjeAgTSB72BOZzkNW3MxEIsk2JLG9yyMv1mIo8Hc/alFqaSzSg==
X-Received: by 2002:adf:8162:: with SMTP id 89mr8736315wrm.387.1588766233499; 
 Wed, 06 May 2020 04:57:13 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 w4sm2398660wro.28.2020.05.06.04.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 04:57:12 -0700 (PDT)
Date: Wed, 6 May 2020 07:57:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jesper Dangaard Brouer <brouer@redhat.com>
Subject: Re: performance bug in virtio net xdp
Message-ID: <20200506075226-mutt-send-email-mst@kernel.org>
References: <20200506035704-mutt-send-email-mst@kernel.org>
 <20200506103757.4bc78b3a@carbon>
MIME-Version: 1.0
In-Reply-To: <20200506103757.4bc78b3a@carbon>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Eugenio Perez Martin <eperezma@redhat.com>, bpf@vger.kernel.org
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

On Wed, May 06, 2020 at 10:37:57AM +0200, Jesper Dangaard Brouer wrote:
> On Wed, 6 May 2020 04:08:27 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > So for mergeable bufs, we use ewma machinery to guess the correct buffer
> > size. If we don't guess correctly, XDP has to do aggressive copies.
> > 
> > Problem is, xdp paths do not update the ewma at all, except
> > sometimes with XDP_PASS. So whatever we happen to have
> > before we attach XDP, will mostly stay around.
> > 
> > The fix is probably to update ewma unconditionally.
> 
> I personally find the code hard to follow, and (I admit) that it took
> me some time to understand this code path (so I might still be wrong).
> 
> In patch[1] I tried to explain (my understanding):
> 
>   In receive_mergeable() the frame size is more dynamic. There are two
>   basic cases: (1) buffer size is based on a exponentially weighted
>   moving average (see DECLARE_EWMA) of packet length. Or (2) in case
>   virtnet_get_headroom() have any headroom then buffer size is
>   PAGE_SIZE. The ctx pointer is this time used for encoding two values;
>   the buffer len "truesize" and headroom. In case (1) if the rx buffer
>   size is underestimated, the packet will have been split over more
>   buffers (num_buf info in virtio_net_hdr_mrg_rxbuf placed in top of
>   buffer area). If that happens the XDP path does a xdp_linearize_page
>   operation.
> 
> 
> The EWMA code is not used when headroom is defined, which e.g. gets
> enabled when running XDP.
> 
> 
> [1] https://lore.kernel.org/netdev/158824572816.2172139.1358700000273697123.stgit@firesoul/

You are right.
So I guess the problem is just inconsistency?

When XDP program returns XDP_PASS, and it all fits in one page,
then we trigger
	        ewma_pkt_len_add(&rq->mrg_avg_pkt_len, head_skb->len);

if it does not trigger XDP_PASS, or does not fit in one page,
then we don't.

Given XDP does not use ewma for sizing, let's not update the average
either.


> -- 
> Best regards,
>   Jesper Dangaard Brouer
>   MSc.CS, Principal Kernel Engineer at Red Hat
>   LinkedIn: http://www.linkedin.com/in/brouer

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
