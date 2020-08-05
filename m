Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E20DF23CAF3
	for <lists.virtualization@lfdr.de>; Wed,  5 Aug 2020 15:27:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7CCC485D9B;
	Wed,  5 Aug 2020 13:26:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KQ6RJJp_Rz6F; Wed,  5 Aug 2020 13:26:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 19C0D85E79;
	Wed,  5 Aug 2020 13:26:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6728C004C;
	Wed,  5 Aug 2020 13:26:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 848CBC004C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 72C718507B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:26:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OfVUOkN8ODRS
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:26:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1F889862C7
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596634014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zyd3PzoPVBU8umiKYNKDpmG6iIok/EZRtyPBBz7RY7k=;
 b=J+7uO2Jl8t7tvPBAlbsVtLvGjnUxhsJz/DFEYPuczckZ7itaUym3R8isT5awtuDfm2iAAQ
 vXiMrW7vJg9yfPQhryRLT2eZraYGKOt+uCIhzBvD4T5k3yFhoyDCASJYOnZPvAkLawRD+B
 GRbUx4WdCs3zmX+f23fp3tp8uRTrMAM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-GyJ8BKErM_yb01ZzY0b4IQ-1; Wed, 05 Aug 2020 09:26:52 -0400
X-MC-Unique: GyJ8BKErM_yb01ZzY0b4IQ-1
Received: by mail-wm1-f71.google.com with SMTP id f74so2727512wmf.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Aug 2020 06:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zyd3PzoPVBU8umiKYNKDpmG6iIok/EZRtyPBBz7RY7k=;
 b=fBHf5tcfRjMD4NvPdMjPpmAMTk5lVwbhpqRTp4d/AB5t5p+EIRCLmnQoZ7eIIheep2
 ZuxJCVMBweymEcxyVqgEofxne/lHcRbmYvJ6KiM9nraDfxTcVtUPCC2EAvHHhkDL7c8S
 IBHc5TK/30XiKu1nQAmfrdJbABUckyr1DqK7jnpA/Fx2WrJA6CisryAzTc7YcqG9hjAv
 qXaMZvPlOnA1RDll4sG3bDBM938htVCAGFjOMfwnEye/FV6y91Tx1Yff2zrmJpu45ehr
 ypYj7ub2K8yNS0jU/cMPqvlX4xjNQNC6el2i96XmSwaT/bD/irWDUPCN6vh7NIWDq4ql
 RXFg==
X-Gm-Message-State: AOAM533x0MApIx3f6ZW79aLbcF2EU4pR0swdAuRhSFGGODxXQFJOH5dT
 MwAByQmmT1NlvGR9BwGQ2Xzaxk8EdKN5zMW1yay4lDKLY06oPL3OWTc9gcVQ0FNA+iVffKLBLh9
 WHZYLUfdjTtA+DoGpXHAodphEgUSeoxsS3db5xkenFg==
X-Received: by 2002:a1c:1b93:: with SMTP id b141mr3365745wmb.150.1596634011543; 
 Wed, 05 Aug 2020 06:26:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwZAH5oygZ0ZUZzuE41OHF5cCSmEBQ89jkVd4RBBHCf1yH6T/rbTULK4FaN2pLJbGTzixbnQ==
X-Received: by 2002:a1c:1b93:: with SMTP id b141mr3365734wmb.150.1596634011358; 
 Wed, 05 Aug 2020 06:26:51 -0700 (PDT)
Received: from redhat.com (bzq-79-178-123-8.red.bezeqint.net. [79.178.123.8])
 by smtp.gmail.com with ESMTPSA id
 g18sm2877887wru.27.2020.08.05.06.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 06:26:50 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:26:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v2 14/24] virtio_net: correct tags for config space fields
Message-ID: <20200805092621-mutt-send-email-mst@kernel.org>
References: <20200803205814.540410-1-mst@redhat.com>
 <20200803205814.540410-15-mst@redhat.com>
 <20200804164444.5174452d.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200804164444.5174452d.cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Tue, Aug 04, 2020 at 04:44:44PM +0200, Cornelia Huck wrote:
> On Mon, 3 Aug 2020 16:59:37 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > Tag config space fields as having virtio endian-ness.
> > 
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > ---
> >  include/uapi/linux/virtio_net.h | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
> > index 19d23e5baa4e..27d996f29dd1 100644
> > --- a/include/uapi/linux/virtio_net.h
> > +++ b/include/uapi/linux/virtio_net.h
> > @@ -87,19 +87,19 @@ struct virtio_net_config {
> >  	/* The config defining mac address (if VIRTIO_NET_F_MAC) */
> >  	__u8 mac[ETH_ALEN];
> >  	/* See VIRTIO_NET_F_STATUS and VIRTIO_NET_S_* above */
> > -	__u16 status;
> > +	__virtio16 status;
> >  	/* Maximum number of each of transmit and receive queues;
> >  	 * see VIRTIO_NET_F_MQ and VIRTIO_NET_CTRL_MQ.
> >  	 * Legal values are between 1 and 0x8000
> >  	 */
> > -	__u16 max_virtqueue_pairs;
> > +	__virtio16 max_virtqueue_pairs;
> >  	/* Default maximum transmit unit advice */
> > -	__u16 mtu;
> > +	__virtio16 mtu;
> >  	/*
> >  	 * speed, in units of 1Mb. All values 0 to INT_MAX are legal.
> >  	 * Any other value stands for unknown.
> >  	 */
> > -	__u32 speed;
> > +	__virtio32 speed;
> 
> Hm... VIRTIO_NET_F_SPEED_DUPLEX can only be negotiated if VERSION_1 has
> also been negotiated; I think this should be __le32?

OK APIs for this are in a separate patch.
I'll add conversion as a patch on top.


> >  	/*
> >  	 * 0x00 - half duplex
> >  	 * 0x01 - full duplex

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
