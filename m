Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3D72E7C87
	for <lists.virtualization@lfdr.de>; Wed, 30 Dec 2020 22:05:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4752886B07;
	Wed, 30 Dec 2020 21:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 48QF7v86u0SA; Wed, 30 Dec 2020 21:05:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7E93F86830;
	Wed, 30 Dec 2020 21:05:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47EFEC013A;
	Wed, 30 Dec 2020 21:05:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BAA8BC013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Dec 2020 21:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9F94785B0D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Dec 2020 21:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yWQkrTAEqX3Z
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Dec 2020 21:05:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BB6AE85A6E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Dec 2020 21:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609362319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jl2RuMVvj0UE3slAWMop7EH+2XqpCKT9x6lrBDOpiaA=;
 b=C8mtnhB3qeykmeaWdJU1sKcXLQDvR7d5uiaP8AlcdzVj+2ZLXJqxU4SmCDncRDxe51SlLI
 pjum8AZG1zvkfj5QCc0jMuikFQqJnwcQPfMKOT2bTcgDIuP/XJ8KqDSZAuRYGT/LDH2HhF
 AKjAfHytkZnfcHmvy7yJvAldb2Eqe8Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-9MN2fUMZNUytIKMwbSF2_g-1; Wed, 30 Dec 2020 16:05:17 -0500
X-MC-Unique: 9MN2fUMZNUytIKMwbSF2_g-1
Received: by mail-wr1-f72.google.com with SMTP id r8so9272203wro.22
 for <virtualization@lists.linux-foundation.org>;
 Wed, 30 Dec 2020 13:05:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jl2RuMVvj0UE3slAWMop7EH+2XqpCKT9x6lrBDOpiaA=;
 b=AX4sTY+k4FQOqP7TyOq4cYGA6IgsLW1wq/Zvk6sWdRsuq4cXYI3fzgCPCRC+AeJsUb
 2zjbZ11GzeBITc+9J3LgcNx3id6z3dvGQLmdLhmke/nNnyrthT5Oq5dyh9je0C3kdm4n
 wZvXolaAVOqAtA8fn86S5bIyDeHocsHdVX8HhLkNJAona08XuwP+4m9nxq06cZuIyBsx
 W5VUuNELMVXZ75FoxkjMB9DU4A1L/UpWS0JxaFaQrm6HvtXgnOiLumHAVOgFDH7j6KQm
 ZjGMVHeRCLJDZTlS6fHPDL3K2CicCsLpnYqhjUWfc3/KYYmtu8ddtq/jkhv/T+UOYe6V
 ZuMg==
X-Gm-Message-State: AOAM533UH0uzFg6iarpqq0ujEqaI4Jl5j6U3uBwPQaS1lEHjerSMT0ec
 42p0+MCzvRJdLuETeCwtOv+J/ysgHk7d1f4u23fubreUowgtrkrmBmr6/x5pKmTjjtFtaaWOmmR
 ZGE9/47BSNL+kkjm+0AdA/tZTL7czOoRCcoL86xcSnA==
X-Received: by 2002:adf:dcc5:: with SMTP id x5mr61270103wrm.167.1609362315708; 
 Wed, 30 Dec 2020 13:05:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWREO78Ad2mWB/buSLkgQoTOgVPrKFRRQrP8d9cZ87TtK8mLv/YrgVBR/nS0wAKwf/2BRp4g==
X-Received: by 2002:adf:dcc5:: with SMTP id x5mr61270078wrm.167.1609362315390; 
 Wed, 30 Dec 2020 13:05:15 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id w4sm8590941wmc.13.2020.12.30.13.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Dec 2020 13:05:14 -0800 (PST)
Date: Wed, 30 Dec 2020 16:05:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [PATCH 1/3] vsock/virtio: support for SOCK_SEQPACKET socket.
Message-ID: <20201230155814-mutt-send-email-mst@kernel.org>
References: <20201229110452.274598-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20201229110452.274598-1-arseny.krasnov@kaspersky.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Tue, Dec 29, 2020 at 02:04:51PM +0300, Arseny Krasnov wrote:
>         To preserve message boundaries, new packet operation was added:
> to mark start of record(with record length in header). To send record,
> packet with start marker is sent first, then all data is transmitted as
> 'RW' packets.
>         On receiver's side, length of record is known from packet with
> start record marker. Now as  packets of one socket are not reordered
> neither on vsock nor on vhost transport layers, these marker allow to
> restore original record on receiver's side. When each 'RW' packet is
> inserted to rx queue of receiver, user is woken up, data is copied to
> user's buffer and credit update message is sent. If there is no user
> waiting for data, credit won't be updated and sender will wait. Also,
> if user's buffer is full, and record is bigger, all unneeded data will
> be dropped(with credit update message).
> 	'MSG_EOR' flag is implemented with special value of 'flags'
> field in packet header. When record is received with such flags,
> 'MSG_EOR' is set in 'recvmsg()' flags.
> 
> Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>


OK this clearly is protocol level work that needs
to involve the virtio TC.

E.g. what you describe sounds like it will work but
won't allow pipelining more than one message in flight.

Support will probably need a feature bit, too.
That needs to be minimally reserved by the TC.


What does and what does not work with this patch?
I see tap support is TODO ...

> ---
>  include/linux/virtio_vsock.h            |   7 +
>  include/net/af_vsock.h                  |   4 +
>  include/uapi/linux/virtio_vsock.h       |   9 +
>  net/vmw_vsock/virtio_transport.c        |   3 +
>  net/vmw_vsock/virtio_transport_common.c | 323 +++++++++++++++++++++---
>  5 files changed, 305 insertions(+), 41 deletions(-)
> 
> diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
> index dc636b727179..4902d71b3252 100644
> --- a/include/linux/virtio_vsock.h
> +++ b/include/linux/virtio_vsock.h
> @@ -36,6 +36,10 @@ struct virtio_vsock_sock {
>  	u32 rx_bytes;
>  	u32 buf_alloc;
>  	struct list_head rx_queue;
> +
> +	/* For SOCK_SEQPACKET */
> +	u32 user_read_seq_len;
> +	u32 user_read_copied;
>  };
>  
>  struct virtio_vsock_pkt {
> @@ -80,6 +84,9 @@ virtio_transport_dgram_dequeue(struct vsock_sock *vsk,
>  			       struct msghdr *msg,
>  			       size_t len, int flags);
>  
> +bool virtio_transport_seqpacket_seq_send_len(struct vsock_sock *vsk, size_t len);
> +size_t virtio_transport_seqpacket_seq_get_len(struct vsock_sock *vsk);
> +
>  s64 virtio_transport_stream_has_data(struct vsock_sock *vsk);
>  s64 virtio_transport_stream_has_space(struct vsock_sock *vsk);
>  
> diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
> index b1c717286993..792ea7b66574 100644
> --- a/include/net/af_vsock.h
> +++ b/include/net/af_vsock.h
> @@ -135,6 +135,10 @@ struct vsock_transport {
>  	bool (*stream_is_active)(struct vsock_sock *);
>  	bool (*stream_allow)(u32 cid, u32 port);
>  
> +	/* SEQ_PACKET. */
> +	bool (*seqpacket_seq_send_len)(struct vsock_sock *, size_t len);
> +	size_t (*seqpacket_seq_get_len)(struct vsock_sock *);
> +
>  	/* Notification. */
>  	int (*notify_poll_in)(struct vsock_sock *, size_t, bool *);
>  	int (*notify_poll_out)(struct vsock_sock *, size_t, bool *);
> diff --git a/include/uapi/linux/virtio_vsock.h b/include/uapi/linux/virtio_vsock.h
> index 1d57ed3d84d2..058908bc19fc 100644
> --- a/include/uapi/linux/virtio_vsock.h
> +++ b/include/uapi/linux/virtio_vsock.h
> @@ -65,6 +65,7 @@ struct virtio_vsock_hdr {
>  
>  enum virtio_vsock_type {
>  	VIRTIO_VSOCK_TYPE_STREAM = 1,
> +	VIRTIO_VSOCK_TYPE_SEQPACKET = 2,
>  };
>  
>  enum virtio_vsock_op {
> @@ -83,6 +84,9 @@ enum virtio_vsock_op {
>  	VIRTIO_VSOCK_OP_CREDIT_UPDATE = 6,
>  	/* Request the peer to send the credit info to us */
>  	VIRTIO_VSOCK_OP_CREDIT_REQUEST = 7,
> +
> +	/* Record begin for SOCK_SEQPACKET */
> +	VIRTIO_VSOCK_OP_SEQ_BEGIN = 8,
>  };
>  
>  /* VIRTIO_VSOCK_OP_SHUTDOWN flags values */
> @@ -91,4 +95,9 @@ enum virtio_vsock_shutdown {
>  	VIRTIO_VSOCK_SHUTDOWN_SEND = 2,
>  };
>  
> +/* VIRTIO_VSOCK_OP_RW flags values for SOCK_SEQPACKET type */
> +enum virtio_vsock_rw_seqpacket {
> +	VIRTIO_VSOCK_RW_EOR = 1,
> +};
> +
>  #endif /* _UAPI_LINUX_VIRTIO_VSOCK_H */
> diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
> index 2700a63ab095..2bd3f7cbffcb 100644
> --- a/net/vmw_vsock/virtio_transport.c
> +++ b/net/vmw_vsock/virtio_transport.c
> @@ -469,6 +469,9 @@ static struct virtio_transport virtio_transport = {
>  		.stream_is_active         = virtio_transport_stream_is_active,
>  		.stream_allow             = virtio_transport_stream_allow,
>  
> +		.seqpacket_seq_send_len	  = virtio_transport_seqpacket_seq_send_len,
> +		.seqpacket_seq_get_len	  = virtio_transport_seqpacket_seq_get_len,
> +
>  		.notify_poll_in           = virtio_transport_notify_poll_in,
>  		.notify_poll_out          = virtio_transport_notify_poll_out,
>  		.notify_recv_init         = virtio_transport_notify_recv_init,
> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> index 5956939eebb7..77c42004e422 100644
> --- a/net/vmw_vsock/virtio_transport_common.c
> +++ b/net/vmw_vsock/virtio_transport_common.c
> @@ -139,6 +139,7 @@ static struct sk_buff *virtio_transport_build_skb(void *opaque)
>  		break;
>  	case VIRTIO_VSOCK_OP_CREDIT_UPDATE:
>  	case VIRTIO_VSOCK_OP_CREDIT_REQUEST:
> +	case VIRTIO_VSOCK_OP_SEQ_BEGIN:
>  		hdr->op = cpu_to_le16(AF_VSOCK_OP_CONTROL);
>  		break;
>  	default:
> @@ -157,6 +158,10 @@ static struct sk_buff *virtio_transport_build_skb(void *opaque)
>  
>  void virtio_transport_deliver_tap_pkt(struct virtio_vsock_pkt *pkt)
>  {
> +	/* TODO: implement tap support for SOCK_SEQPACKET. */
> +	if (le32_to_cpu(pkt->hdr.type) == VIRTIO_VSOCK_TYPE_SEQPACKET)
> +		return;
> +
>  	if (pkt->tap_delivered)
>  		return;
>  
> @@ -230,10 +235,10 @@ static bool virtio_transport_inc_rx_pkt(struct virtio_vsock_sock *vvs,
>  }
>  
>  static void virtio_transport_dec_rx_pkt(struct virtio_vsock_sock *vvs,
> -					struct virtio_vsock_pkt *pkt)
> +					u32 len)
>  {
> -	vvs->rx_bytes -= pkt->len;
> -	vvs->fwd_cnt += pkt->len;
> +	vvs->rx_bytes -= len;
> +	vvs->fwd_cnt += len;
>  }
>  
>  void virtio_transport_inc_tx_pkt(struct virtio_vsock_sock *vvs, struct virtio_vsock_pkt *pkt)
> @@ -365,7 +370,7 @@ virtio_transport_stream_do_dequeue(struct vsock_sock *vsk,
>  		total += bytes;
>  		pkt->off += bytes;
>  		if (pkt->off == pkt->len) {
> -			virtio_transport_dec_rx_pkt(vvs, pkt);
> +			virtio_transport_dec_rx_pkt(vvs, pkt->len);
>  			list_del(&pkt->list);
>  			virtio_transport_free_pkt(pkt);
>  		}
> @@ -397,15 +402,202 @@ virtio_transport_stream_do_dequeue(struct vsock_sock *vsk,
>  	return err;
>  }
>  
> +static u16 virtio_transport_get_type(struct sock *sk)
> +{
> +	if (sk->sk_type == SOCK_STREAM)
> +		return VIRTIO_VSOCK_TYPE_STREAM;
> +	else
> +		return VIRTIO_VSOCK_TYPE_SEQPACKET;
> +}
> +
> +bool virtio_transport_seqpacket_seq_send_len(struct vsock_sock *vsk, size_t len)
> +{
> +	struct virtio_vsock_pkt_info info = {
> +		.type = VIRTIO_VSOCK_TYPE_SEQPACKET,
> +		.op = VIRTIO_VSOCK_OP_SEQ_BEGIN,
> +		.vsk = vsk,
> +		.flags = len
> +	};
> +
> +	return virtio_transport_send_pkt_info(vsk, &info);
> +}
> +EXPORT_SYMBOL_GPL(virtio_transport_seqpacket_seq_send_len);
> +
> +static inline void virtio_transport_del_n_free_pkt(struct virtio_vsock_pkt *pkt)
> +{
> +	list_del(&pkt->list);
> +	virtio_transport_free_pkt(pkt);
> +}
> +
> +static size_t virtio_transport_drop_until_seq_begin(struct virtio_vsock_sock *vvs)
> +{
> +	struct virtio_vsock_pkt *pkt, *n;
> +	size_t bytes_dropped = 0;
> +
> +	list_for_each_entry_safe(pkt, n, &vvs->rx_queue, list) {
> +		if (le16_to_cpu(pkt->hdr.op) == VIRTIO_VSOCK_OP_SEQ_BEGIN)
> +			break;
> +
> +		bytes_dropped += le32_to_cpu(pkt->hdr.len);
> +		virtio_transport_dec_rx_pkt(vvs, pkt->len);
> +		virtio_transport_del_n_free_pkt(pkt);
> +	}
> +
> +	return bytes_dropped;
> +}
> +
> +size_t virtio_transport_seqpacket_seq_get_len(struct vsock_sock *vsk)
> +{
> +	struct virtio_vsock_sock *vvs = vsk->trans;
> +	struct virtio_vsock_pkt *pkt;
> +	size_t bytes_dropped;
> +
> +	spin_lock_bh(&vvs->rx_lock);
> +
> +	/* Fetch all orphaned 'RW', packets, and
> +	 * send credit update.
> +	 */
> +	bytes_dropped = virtio_transport_drop_until_seq_begin(vvs);
> +
> +	if (list_empty(&vvs->rx_queue))
> +		goto out;
> +
> +	pkt = list_first_entry(&vvs->rx_queue, struct virtio_vsock_pkt, list);
> +
> +	vvs->user_read_copied = 0;
> +	vvs->user_read_seq_len = le32_to_cpu(pkt->hdr.flags);
> +	virtio_transport_del_n_free_pkt(pkt);
> +out:
> +	spin_unlock_bh(&vvs->rx_lock);
> +
> +	if (bytes_dropped)
> +		virtio_transport_send_credit_update(vsk,
> +						    VIRTIO_VSOCK_TYPE_SEQPACKET,
> +						    NULL);
> +
> +	return vvs->user_read_seq_len;
> +}
> +EXPORT_SYMBOL_GPL(virtio_transport_seqpacket_seq_get_len);
> +
> +static ssize_t virtio_transport_seqpacket_do_dequeue(struct vsock_sock *vsk,
> +						     struct msghdr *msg,
> +						     size_t user_buf_len)
> +{
> +	struct virtio_vsock_sock *vvs = vsk->trans;
> +	struct virtio_vsock_pkt *pkt;
> +	size_t bytes_handled = 0;
> +	int err = 0;
> +
> +	spin_lock_bh(&vvs->rx_lock);
> +
> +	if (user_buf_len == 0) {
> +		/* User's buffer is full, we processing rest of
> +		 * record and drop it. If 'SEQ_BEGIN' is found
> +		 * while iterating, user will be woken up,
> +		 * because record is already copied, and we
> +		 * don't care about absent of some tail RW packets
> +		 * of it. Return number of bytes(rest of record),
> +		 * but ignore credit update for such absent bytes.
> +		 */
> +		bytes_handled = virtio_transport_drop_until_seq_begin(vvs);
> +		vvs->user_read_copied += bytes_handled;
> +
> +		if (!list_empty(&vvs->rx_queue) &&
> +		    vvs->user_read_copied < vvs->user_read_seq_len) {
> +			/* 'SEQ_BEGIN' found, but record isn't complete.
> +			 * Set number of copied bytes to fit record size
> +			 * and force counters to finish receiving.
> +			 */
> +			bytes_handled += (vvs->user_read_seq_len - vvs->user_read_copied);
> +			vvs->user_read_copied = vvs->user_read_seq_len;
> +		}
> +	}
> +
> +	/* Now start copying. */
> +	while (vvs->user_read_copied < vvs->user_read_seq_len &&
> +	       vvs->rx_bytes &&
> +	       user_buf_len &&
> +	       !err) {
> +		pkt = list_first_entry(&vvs->rx_queue, struct virtio_vsock_pkt, list);
> +
> +		switch (le16_to_cpu(pkt->hdr.op)) {
> +		case VIRTIO_VSOCK_OP_SEQ_BEGIN: {
> +			/* Unexpected 'SEQ_BEGIN' during record copy:
> +			 * Leave receive loop, 'EAGAIN' will restart it from
> +			 * outer receive loop, packet is still in queue and
> +			 * counters are cleared. So in next loop enter,
> +			 * 'SEQ_BEGIN' will be dequeued first. User's iov
> +			 * iterator will be reset in outer loop. Also
> +			 * send credit update, because some bytes could be
> +			 * copied. User will never see unfinished record.
> +			 */
> +			err = -EAGAIN;
> +			break;
> +		}
> +		case VIRTIO_VSOCK_OP_RW: {
> +			size_t bytes_to_copy;
> +			size_t pkt_len;
> +
> +			pkt_len = (size_t)le32_to_cpu(pkt->hdr.len);
> +			bytes_to_copy = min(user_buf_len, pkt_len);
> +
> +			/* sk_lock is held by caller so no one else can dequeue.
> +			 * Unlock rx_lock since memcpy_to_msg() may sleep.
> +			 */
> +			spin_unlock_bh(&vvs->rx_lock);
> +
> +			if (memcpy_to_msg(msg, pkt->buf, bytes_to_copy)) {
> +				spin_lock_bh(&vvs->rx_lock);
> +				err = -EINVAL;
> +				break;
> +			}
> +
> +			spin_lock_bh(&vvs->rx_lock);
> +			user_buf_len -= bytes_to_copy;
> +			bytes_handled += pkt->len;
> +			vvs->user_read_copied += bytes_to_copy;
> +
> +			if (le16_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_RW_EOR)
> +				msg->msg_flags |= MSG_EOR;
> +			break;
> +		}
> +		default:
> +			;
> +		}
> +
> +		/* For unexpected 'SEQ_BEGIN', keep such packet in queue,
> +		 * but drop any other type of packet.
> +		 */
> +		if (le16_to_cpu(pkt->hdr.op) != VIRTIO_VSOCK_OP_SEQ_BEGIN) {
> +			virtio_transport_dec_rx_pkt(vvs, pkt->len);
> +			virtio_transport_del_n_free_pkt(pkt);
> +		}
> +	}
> +
> +	spin_unlock_bh(&vvs->rx_lock);
> +
> +	virtio_transport_send_credit_update(vsk, VIRTIO_VSOCK_TYPE_SEQPACKET,
> +					    NULL);
> +
> +	return err ?: bytes_handled;
> +}
> +
>  ssize_t
>  virtio_transport_stream_dequeue(struct vsock_sock *vsk,
>  				struct msghdr *msg,
>  				size_t len, int flags)
>  {
> -	if (flags & MSG_PEEK)
> -		return virtio_transport_stream_do_peek(vsk, msg, len);
> -	else
> +	if (virtio_transport_get_type(sk_vsock(vsk)) == VIRTIO_VSOCK_TYPE_SEQPACKET) {
> +		if (flags & MSG_PEEK)
> +			return -EOPNOTSUPP;
> +
> +		return virtio_transport_seqpacket_do_dequeue(vsk, msg, len);
> +	} else {
> +		if (flags & MSG_PEEK)
> +			return virtio_transport_stream_do_peek(vsk, msg, len);
> +
>  		return virtio_transport_stream_do_dequeue(vsk, msg, len);
> +	}
>  }
>  EXPORT_SYMBOL_GPL(virtio_transport_stream_dequeue);
>  
> @@ -481,6 +673,8 @@ int virtio_transport_do_socket_init(struct vsock_sock *vsk,
>  	spin_lock_init(&vvs->rx_lock);
>  	spin_lock_init(&vvs->tx_lock);
>  	INIT_LIST_HEAD(&vvs->rx_queue);
> +	vvs->user_read_copied = 0;
> +	vvs->user_read_seq_len = 0;
>  
>  	return 0;
>  }
> @@ -490,13 +684,16 @@ EXPORT_SYMBOL_GPL(virtio_transport_do_socket_init);
>  void virtio_transport_notify_buffer_size(struct vsock_sock *vsk, u64 *val)
>  {
>  	struct virtio_vsock_sock *vvs = vsk->trans;
> +	int type;
>  
>  	if (*val > VIRTIO_VSOCK_MAX_BUF_SIZE)
>  		*val = VIRTIO_VSOCK_MAX_BUF_SIZE;
>  
>  	vvs->buf_alloc = *val;
>  
> -	virtio_transport_send_credit_update(vsk, VIRTIO_VSOCK_TYPE_STREAM,
> +	type = virtio_transport_get_type(sk_vsock(vsk));
> +
> +	virtio_transport_send_credit_update(vsk, type,
>  					    NULL);
>  }
>  EXPORT_SYMBOL_GPL(virtio_transport_notify_buffer_size);
> @@ -624,10 +821,11 @@ int virtio_transport_connect(struct vsock_sock *vsk)
>  {
>  	struct virtio_vsock_pkt_info info = {
>  		.op = VIRTIO_VSOCK_OP_REQUEST,
> -		.type = VIRTIO_VSOCK_TYPE_STREAM,
>  		.vsk = vsk,
>  	};
>  
> +	info.type = virtio_transport_get_type(sk_vsock(vsk));
> +
>  	return virtio_transport_send_pkt_info(vsk, &info);
>  }
>  EXPORT_SYMBOL_GPL(virtio_transport_connect);
> @@ -636,7 +834,6 @@ int virtio_transport_shutdown(struct vsock_sock *vsk, int mode)
>  {
>  	struct virtio_vsock_pkt_info info = {
>  		.op = VIRTIO_VSOCK_OP_SHUTDOWN,
> -		.type = VIRTIO_VSOCK_TYPE_STREAM,
>  		.flags = (mode & RCV_SHUTDOWN ?
>  			  VIRTIO_VSOCK_SHUTDOWN_RCV : 0) |
>  			 (mode & SEND_SHUTDOWN ?
> @@ -644,6 +841,8 @@ int virtio_transport_shutdown(struct vsock_sock *vsk, int mode)
>  		.vsk = vsk,
>  	};
>  
> +	info.type = virtio_transport_get_type(sk_vsock(vsk));
> +
>  	return virtio_transport_send_pkt_info(vsk, &info);
>  }
>  EXPORT_SYMBOL_GPL(virtio_transport_shutdown);
> @@ -665,12 +864,18 @@ virtio_transport_stream_enqueue(struct vsock_sock *vsk,
>  {
>  	struct virtio_vsock_pkt_info info = {
>  		.op = VIRTIO_VSOCK_OP_RW,
> -		.type = VIRTIO_VSOCK_TYPE_STREAM,
>  		.msg = msg,
>  		.pkt_len = len,
>  		.vsk = vsk,
> +		.flags = 0,
>  	};
>  
> +	info.type = virtio_transport_get_type(sk_vsock(vsk));
> +
> +	if (info.type == VIRTIO_VSOCK_TYPE_SEQPACKET &&
> +	    msg->msg_flags & MSG_EOR)
> +		info.flags |= VIRTIO_VSOCK_RW_EOR;
> +
>  	return virtio_transport_send_pkt_info(vsk, &info);
>  }
>  EXPORT_SYMBOL_GPL(virtio_transport_stream_enqueue);
> @@ -688,7 +893,6 @@ static int virtio_transport_reset(struct vsock_sock *vsk,
>  {
>  	struct virtio_vsock_pkt_info info = {
>  		.op = VIRTIO_VSOCK_OP_RST,
> -		.type = VIRTIO_VSOCK_TYPE_STREAM,
>  		.reply = !!pkt,
>  		.vsk = vsk,
>  	};
> @@ -697,6 +901,8 @@ static int virtio_transport_reset(struct vsock_sock *vsk,
>  	if (pkt && le16_to_cpu(pkt->hdr.op) == VIRTIO_VSOCK_OP_RST)
>  		return 0;
>  
> +	info.type = virtio_transport_get_type(sk_vsock(vsk));
> +
>  	return virtio_transport_send_pkt_info(vsk, &info);
>  }
>  
> @@ -884,44 +1090,59 @@ virtio_transport_recv_connecting(struct sock *sk,
>  	return err;
>  }
>  
> -static void
> +static bool
>  virtio_transport_recv_enqueue(struct vsock_sock *vsk,
>  			      struct virtio_vsock_pkt *pkt)
>  {
>  	struct virtio_vsock_sock *vvs = vsk->trans;
> -	bool can_enqueue, free_pkt = false;
> +	bool data_ready = false;
> +	bool free_pkt = false;
>  
> -	pkt->len = le32_to_cpu(pkt->hdr.len);
>  	pkt->off = 0;
> +	pkt->len = le32_to_cpu(pkt->hdr.len);
>  
>  	spin_lock_bh(&vvs->rx_lock);
>  
> -	can_enqueue = virtio_transport_inc_rx_pkt(vvs, pkt);
> -	if (!can_enqueue) {
> -		free_pkt = true;
> -		goto out;
> -	}
> +	switch (le32_to_cpu(pkt->hdr.type)) {
> +	case VIRTIO_VSOCK_TYPE_STREAM: {
> +		if (!virtio_transport_inc_rx_pkt(vvs, pkt)) {
> +			free_pkt = true;
> +			goto out;
> +		}
>  
> -	/* Try to copy small packets into the buffer of last packet queued,
> -	 * to avoid wasting memory queueing the entire buffer with a small
> -	 * payload.
> -	 */
> -	if (pkt->len <= GOOD_COPY_LEN && !list_empty(&vvs->rx_queue)) {
> -		struct virtio_vsock_pkt *last_pkt;
> +		/* Try to copy small packets into the buffer of last packet queued,
> +		 * to avoid wasting memory queueing the entire buffer with a small
> +		 * payload.
> +		 */
> +		if (pkt->len <= GOOD_COPY_LEN && !list_empty(&vvs->rx_queue)) {
> +			struct virtio_vsock_pkt *last_pkt;
>  
> -		last_pkt = list_last_entry(&vvs->rx_queue,
> -					   struct virtio_vsock_pkt, list);
> +			last_pkt = list_last_entry(&vvs->rx_queue,
> +						   struct virtio_vsock_pkt, list);
>  
> -		/* If there is space in the last packet queued, we copy the
> -		 * new packet in its buffer.
> -		 */
> -		if (pkt->len <= last_pkt->buf_len - last_pkt->len) {
> -			memcpy(last_pkt->buf + last_pkt->len, pkt->buf,
> -			       pkt->len);
> -			last_pkt->len += pkt->len;
> -			free_pkt = true;
> -			goto out;
> +			/* If there is space in the last packet queued, we copy the
> +			 * new packet in its buffer.
> +			 */
> +			if (pkt->len <= last_pkt->buf_len - last_pkt->len) {
> +				memcpy(last_pkt->buf + last_pkt->len, pkt->buf,
> +				       pkt->len);
> +				last_pkt->len += pkt->len;
> +				free_pkt = true;
> +				goto out;
> +			}
>  		}
> +
> +		data_ready = true;
> +		break;
> +	}
> +
> +	case VIRTIO_VSOCK_TYPE_SEQPACKET: {
> +		data_ready = true;
> +		vvs->rx_bytes += pkt->len;
> +		break;
> +	}
> +	default:
> +		goto out;
>  	}
>  
>  	list_add_tail(&pkt->list, &vvs->rx_queue);
> @@ -930,6 +1151,8 @@ virtio_transport_recv_enqueue(struct vsock_sock *vsk,
>  	spin_unlock_bh(&vvs->rx_lock);
>  	if (free_pkt)
>  		virtio_transport_free_pkt(pkt);
> +
> +	return data_ready;
>  }
>  
>  static int
> @@ -940,9 +1163,17 @@ virtio_transport_recv_connected(struct sock *sk,
>  	int err = 0;
>  
>  	switch (le16_to_cpu(pkt->hdr.op)) {
> +	case VIRTIO_VSOCK_OP_SEQ_BEGIN: {
> +		struct virtio_vsock_sock *vvs = vsk->trans;
> +
> +		spin_lock_bh(&vvs->rx_lock);
> +		list_add_tail(&pkt->list, &vvs->rx_queue);
> +		spin_unlock_bh(&vvs->rx_lock);
> +		return err;
> +	}
>  	case VIRTIO_VSOCK_OP_RW:
> -		virtio_transport_recv_enqueue(vsk, pkt);
> -		sk->sk_data_ready(sk);
> +		if (virtio_transport_recv_enqueue(vsk, pkt))
> +			sk->sk_data_ready(sk);
>  		return err;
>  	case VIRTIO_VSOCK_OP_CREDIT_UPDATE:
>  		sk->sk_write_space(sk);
> @@ -990,13 +1221,14 @@ virtio_transport_send_response(struct vsock_sock *vsk,
>  {
>  	struct virtio_vsock_pkt_info info = {
>  		.op = VIRTIO_VSOCK_OP_RESPONSE,
> -		.type = VIRTIO_VSOCK_TYPE_STREAM,
>  		.remote_cid = le64_to_cpu(pkt->hdr.src_cid),
>  		.remote_port = le32_to_cpu(pkt->hdr.src_port),
>  		.reply = true,
>  		.vsk = vsk,
>  	};
>  
> +	info.type = virtio_transport_get_type(sk_vsock(vsk));
> +
>  	return virtio_transport_send_pkt_info(vsk, &info);
>  }
>  
> @@ -1086,6 +1318,12 @@ virtio_transport_recv_listen(struct sock *sk, struct virtio_vsock_pkt *pkt,
>  	return 0;
>  }
>  
> +static bool virtio_transport_valid_type(u16 type)
> +{
> +	return (type == VIRTIO_VSOCK_TYPE_STREAM) ||
> +	       (type == VIRTIO_VSOCK_TYPE_SEQPACKET);
> +}
> +
>  /* We are under the virtio-vsock's vsock->rx_lock or vhost-vsock's vq->mutex
>   * lock.
>   */
> @@ -1111,7 +1349,7 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
>  					le32_to_cpu(pkt->hdr.buf_alloc),
>  					le32_to_cpu(pkt->hdr.fwd_cnt));
>  
> -	if (le16_to_cpu(pkt->hdr.type) != VIRTIO_VSOCK_TYPE_STREAM) {
> +	if (!virtio_transport_valid_type(le16_to_cpu(pkt->hdr.type))) {
>  		(void)virtio_transport_reset_no_sock(t, pkt);
>  		goto free_pkt;
>  	}
> @@ -1128,6 +1366,9 @@ void virtio_transport_recv_pkt(struct virtio_transport *t,
>  		}
>  	}
>  
> +	if (virtio_transport_get_type(sk) != le16_to_cpu(pkt->hdr.type))
> +		goto free_pkt;
> +
>  	vsk = vsock_sk(sk);
>  
>  	space_available = virtio_transport_space_update(sk, pkt);
> -- 
> 2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
