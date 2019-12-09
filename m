Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D5883116C67
	for <lists.virtualization@lfdr.de>; Mon,  9 Dec 2019 12:39:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 58A508768C;
	Mon,  9 Dec 2019 11:39:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VX1Rv2DeCxd8; Mon,  9 Dec 2019 11:39:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C71638763C;
	Mon,  9 Dec 2019 11:39:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B75F6C0881;
	Mon,  9 Dec 2019 11:39:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CEC68C0881
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 11:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C4AB78768C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 11:39:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vyNT5-lNodh1
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 11:39:45 +0000 (UTC)
X-Greylist: delayed 00:44:52 by SQLgrey-1.7.6
Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6FDDE87635
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 11:39:45 +0000 (UTC)
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.92.3) (envelope-from <johannes@sipsolutions.net>)
 id 1ieGgi-00FN4j-L6; Mon, 09 Dec 2019 11:54:48 +0100
Message-ID: <db33800253f071a1cfbb91f413af59e73faa6775.camel@sipsolutions.net>
Subject: Re: [PATCH] virtio: Work around frames incorrectly marked as gso
From: Johannes Berg <johannes@sipsolutions.net>
To: anton.ivanov@cambridgegreys.com, netdev@vger.kernel.org
Date: Mon, 09 Dec 2019 11:54:46 +0100
In-Reply-To: <20191209104824.17059-1-anton.ivanov@cambridgegreys.com>
References: <20191209104824.17059-1-anton.ivanov@cambridgegreys.com>
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
Cc: mst@redhat.com, linux-um@lists.infradead.org,
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


>  		else if (sinfo->gso_type & SKB_GSO_TCPV6)
>  			hdr->gso_type = VIRTIO_NET_HDR_GSO_TCPV6;
> -		else
> -			return -EINVAL;
> +		else {
> +			if (skb->data_len == 0)
> +				hdr->gso_type = VIRTIO_NET_HDR_GSO_NONE;


maybe use "else if" like in the before? yes, it's a different type of
condition, but braces look a bit unnatural here to me at least

johannes


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
