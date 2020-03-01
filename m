Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7320B174C4D
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 09:44:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F05C887099;
	Sun,  1 Mar 2020 08:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r001Bc01003a; Sun,  1 Mar 2020 08:44:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2256987096;
	Sun,  1 Mar 2020 08:44:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09C0DC013E;
	Sun,  1 Mar 2020 08:44:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DA98C013E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 08:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6937E2284F
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 08:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8OwmV0PV5FS
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 08:44:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 102D32284A
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583052264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ve4baa/uoWtpciHy4RZw3e9cVkoIzMaeirVE4vAjmt8=;
 b=fsTd/+TNV1Ha38i+jWiBjzFlaWuLWV/C/dP7Fhd7tA+0VotR+PrxPuCrX03DsZmvhh28An
 w+oc35tIpWr3RX+ftvKtXQjzx1aprl6vobTXw2I88pxxn9jVdIV7T+oU5W84oXkG9+M7iH
 Q725qVUGZmzm579boyalnlKk7RWLpyA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-AWZggi8qME-bbIlR86gAkQ-1; Sun, 01 Mar 2020 03:44:22 -0500
X-MC-Unique: AWZggi8qME-bbIlR86gAkQ-1
Received: by mail-qk1-f199.google.com with SMTP id n130so6782077qke.19
 for <virtualization@lists.linux-foundation.org>;
 Sun, 01 Mar 2020 00:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ve4baa/uoWtpciHy4RZw3e9cVkoIzMaeirVE4vAjmt8=;
 b=ZoiezVhP+uPMUvPrwUwSX0hZb7ZMr2zb16XTEEsyaGHGw4QKKv3JgHJAQbY7Dt7/Dg
 Ua44sK8xQsGB3gWjcfHDbINI7pBmTssMVxCUfAqMDQ4VBxVSjrxHeDTguqomrAnUaGAG
 t96oaFB2g2pCciRdGOJzC40BI6DcZk6i3F953ieAtmVCRg8zqukfmxa6bBsufPbGRWKy
 DwMDLbFriaKssE+czW4AtgglsfPtaLzrLc2lgAxn+sI8DclaTQ0YkB6X9ZmU60iDsm2z
 RkR6rO7lcjCPou8loouWgx0G3+Df5BR8OFsCUMa9AXxSc3O+gjxZHNMRopnVQlLOVl/1
 Gr8Q==
X-Gm-Message-State: APjAAAViWqR1+75A7TDPAV11VkEzkiTyxdMMoWoSeUipm/O8UmdZOblM
 XoGd96sqg39BWcL/9dl72vNpbviFcGypkGdis2oR8Ojw9efz7EAJQd7jIHlFkdiSqCdisS9q7wt
 dHt+vNkWjhzVkT3Z6jsrwDQITQqNxRgzYoCWUWWuTnA==
X-Received: by 2002:ac8:1ca:: with SMTP id b10mr10858786qtg.314.1583052261584; 
 Sun, 01 Mar 2020 00:44:21 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQZwRK6FPvg3UgljEJZXn2zM3KbSiAn5tKLShK+MTwZKzyxU90cXow/tz9ciBgVdmnpo9eYA==
X-Received: by 2002:ac8:1ca:: with SMTP id b10mr10858775qtg.314.1583052261317; 
 Sun, 01 Mar 2020 00:44:21 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id q1sm545806qtp.81.2020.03.01.00.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 00:44:20 -0800 (PST)
Date: Sun, 1 Mar 2020 03:44:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH 1/3] virtio-net: Introduce extended RSC feature
Message-ID: <20200301034337-mutt-send-email-mst@kernel.org>
References: <20200229171301.15234-1-yuri.benditovich@daynix.com>
 <20200229171301.15234-2-yuri.benditovich@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20200229171301.15234-2-yuri.benditovich@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: yan@daynix.com, linux-kernel@vger.kernel.org,
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

On Sat, Feb 29, 2020 at 07:12:59PM +0200, Yuri Benditovich wrote:
> VIRTIO_NET_F_RSC_EXT feature bit indicates that the device
> is able to provide extended RSC information. When the feature
> is negotiatede and 'gso_type' field in received packet is not
> GSO_NONE, the device reports number of coalesced packets in
> 'csum_start' field and number of duplicated acks in 'csum_offset'
> field and sets VIRTIO_NET_HDR_F_RSC_INFO in 'flags' field.
> 
> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> ---
>  include/uapi/linux/virtio_net.h | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
> index a3715a3224c1..6e26a2cc6ad0 100644
> --- a/include/uapi/linux/virtio_net.h
> +++ b/include/uapi/linux/virtio_net.h
> @@ -57,6 +57,7 @@
>  					 * Steering */
>  #define VIRTIO_NET_F_CTRL_MAC_ADDR 23	/* Set MAC address */
>  
> +#define VIRTIO_NET_F_RSC_EXT	  61	/* extended coalescing info */
>  #define VIRTIO_NET_F_STANDBY	  62	/* Act as standby for another device
>  					 * with the same MAC.
>  					 */
> @@ -104,6 +105,7 @@ struct virtio_net_config {
>  struct virtio_net_hdr_v1 {
>  #define VIRTIO_NET_HDR_F_NEEDS_CSUM	1	/* Use csum_start, csum_offset */
>  #define VIRTIO_NET_HDR_F_DATA_VALID	2	/* Csum is valid */
> +#define VIRTIO_NET_HDR_F_RSC_INFO	4	/* rsc info in csum_ fields */
>  	__u8 flags;
>  #define VIRTIO_NET_HDR_GSO_NONE		0	/* Not a GSO frame */
>  #define VIRTIO_NET_HDR_GSO_TCPV4	1	/* GSO frame, IPv4 TCP (TSO) */
> @@ -113,8 +115,14 @@ struct virtio_net_hdr_v1 {
>  	__u8 gso_type;
>  	__virtio16 hdr_len;	/* Ethernet + IP + tcp/udp hdrs */
>  	__virtio16 gso_size;	/* Bytes to append to hdr_len per frame */
> -	__virtio16 csum_start;	/* Position to start checksumming from */
> -	__virtio16 csum_offset;	/* Offset after that to place checksum */
> +	union {
> +		__virtio16 csum_start;	/* Position to start checksumming from */
> +		__virtio16 rsc_ext_num_packets; /* num of coalesced packets */
> +	};
> +	union {
> +		__virtio16 csum_offset;	/* Offset after that to place checksum */
> +		__virtio16 rsc_ext_num_dupacks; /* num of duplicated acks */
> +	};
>  	__virtio16 num_buffers;	/* Number of merged rx buffers */
>  };


New fields should all be __le, not __virtio.

>  
> -- 
> 2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
