Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A36174D00
	for <lists.virtualization@lfdr.de>; Sun,  1 Mar 2020 12:31:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5FC0384E2E;
	Sun,  1 Mar 2020 11:31:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCSQSy8dd8c9; Sun,  1 Mar 2020 11:31:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 474F984E10;
	Sun,  1 Mar 2020 11:31:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27E4CC013E;
	Sun,  1 Mar 2020 11:31:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03EF1C013E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EBE5484E2E
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sp-l9jhiakqd
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:31:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1337984E10
 for <virtualization@lists.linux-foundation.org>;
 Sun,  1 Mar 2020 11:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583062278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5xDhBGVr9c1BXhYRdm31X1rXWV39DILtVF22GzCedds=;
 b=VDy7NozQQWWslcI/nchuKqyB4TNGsX9VLQQwcQfCCqWfw5OyjdbK+FwGJ8/hDU6Oxy7prk
 b/8CR8S3nxIKdBxxOUQ/zNqEcK8B3ISH7u1ZHARFAjCc5vd64tzyd3e2lXqo7KI0++ZQyg
 9nQjMJHW6aOjLkDayYcPhUd2N70HrAI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-z5NLBdIxPWOmVFEC9phZ4g-1; Sun, 01 Mar 2020 06:31:17 -0500
X-MC-Unique: z5NLBdIxPWOmVFEC9phZ4g-1
Received: by mail-qv1-f72.google.com with SMTP id cn2so6666739qvb.1
 for <virtualization@lists.linux-foundation.org>;
 Sun, 01 Mar 2020 03:31:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5xDhBGVr9c1BXhYRdm31X1rXWV39DILtVF22GzCedds=;
 b=toADYF5y3RbLOR+61WEYw1iTvVYRORxtNWdqfUi+IUFjTP+KnolwkYppddKUgGg3dH
 7NxDmAjND4B32iKpc9UgFxIL3wsRIBlep3LdjrtsstaCAfTz+y+qFLsAIA9qowR4s4Mj
 DXm4Vv1UYcbxtHlUXlxbYVuzrIsfUlal4bLgqjdQd6Q8oZxLKKcdnGgBEH6rEYk9J26M
 C2iA7rb4WzsrqMAfM6m6Diq3SEaGexSJ2PwySMJU8DD9VA0CccJP811YdBTO9FO66joR
 S6NaEqP8WwWWGnwH7wruzLzQEeDfGHHJ5mQzXc7LgVlbgd3QxT4bnYvOwEVC49vbH/1A
 g93w==
X-Gm-Message-State: APjAAAXcJ6yNJuxNWoOtC4c5f4JaUommldEYU6djl0MyNPAI0+JD0O6f
 B2sMlVt02VkUHVio+b3UYH+fxL4ATKOzzCsqaR+IiyqrxOrhF9G68Ct5jiZerbgSklLGodVLmy1
 T7/SugdBq396RXQc0Y9vmszDpS8IxYNIFE4BUTGABcw==
X-Received: by 2002:a37:947:: with SMTP id 68mr11969986qkj.227.1583062276724; 
 Sun, 01 Mar 2020 03:31:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqyBaNBC3EsSqJsn96nKXNvoVQHpYbPD8ZeiLij0I5FhJABuYT3C2FsJzahz5IjDClPNrmkA5Q==
X-Received: by 2002:a37:947:: with SMTP id 68mr11969960qkj.227.1583062276419; 
 Sun, 01 Mar 2020 03:31:16 -0800 (PST)
Received: from redhat.com (bzq-79-180-48-224.red.bezeqint.net. [79.180.48.224])
 by smtp.gmail.com with ESMTPSA id b25sm8236813qkh.6.2020.03.01.03.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 03:31:15 -0800 (PST)
Date: Sun, 1 Mar 2020 06:31:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Subject: Re: [PATCH v2 1/3] virtio-net: Introduce extended RSC feature
Message-ID: <20200301061745-mutt-send-email-mst@kernel.org>
References: <20200301110733.20197-1-yuri.benditovich@daynix.com>
 <20200301110733.20197-2-yuri.benditovich@daynix.com>
MIME-Version: 1.0
In-Reply-To: <20200301110733.20197-2-yuri.benditovich@daynix.com>
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

On Sun, Mar 01, 2020 at 01:07:31PM +0200, Yuri Benditovich wrote:
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
> index a3715a3224c1..536152fad3c4 100644
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
> +		__le16 rsc_ext_num_packets; /* num of coalesced packets */
> +	};
> +	union {
> +		__virtio16 csum_offset;	/* Offset after that to place checksum */
> +		__le16 rsc_ext_num_dupacks; /* num of duplicated acks */

dupacks -> dup_acks ?

Also wouldn't it be cleaner to have an rsc struct? And "num" is kind of
extraneous, right?
So how about we group the fields:

union {
	/* Unnamed struct for compatiblity. */
	struct {
		csum_start
		csum_offset
	};
	struct {
		virtio16 start;
		virtio16 offset;
	} csum;
	struct {
		le16 packets;
		le16 dup_acks;
	} rsc;
};


what do you think?


> +	};
>  	__virtio16 num_buffers;	/* Number of merged rx buffers */
>  };



> -- 
> 2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
