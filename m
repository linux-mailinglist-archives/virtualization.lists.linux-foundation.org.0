Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CBD40A6E7
	for <lists.virtualization@lfdr.de>; Tue, 14 Sep 2021 08:53:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 246884016A;
	Tue, 14 Sep 2021 06:52:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FTC8ufJV8J6E; Tue, 14 Sep 2021 06:52:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0F860402A8;
	Tue, 14 Sep 2021 06:52:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AC07C000D;
	Tue, 14 Sep 2021 06:52:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02E9AC000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 06:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2DC780E19
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 06:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YlcYfmEMLsqC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 06:52:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 55AD880E03
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 06:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631602371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qQQ+VRYUpQLkXGDK2lyOVCEei5nig3VFU2Hz9pZXU2M=;
 b=U76DHbAtkwem/P8kJlXtRJdufmaYtVQb+Yd9pz/rQDP8lJkwJlfZzCIRveaDA2BdtmRWpq
 7Y43FfZhVf9AOrglLki8as8KHqgTnmnRYB8nr7WSlbLFXnff6g2QB1HT4myferjTeHek37
 PKAHaalyLAP5gYK6SiMbT2xvWwRUFWU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-viBN0FfFNWSGJZWRQm52FQ-1; Tue, 14 Sep 2021 02:52:50 -0400
X-MC-Unique: viBN0FfFNWSGJZWRQm52FQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 v15-20020adff68f000000b0015df51efa18so2227471wrp.16
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Sep 2021 23:52:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qQQ+VRYUpQLkXGDK2lyOVCEei5nig3VFU2Hz9pZXU2M=;
 b=m9oAche8dwft6H3FHxEgPq1PBKhTcDXUz5ftYIzoXJDYaAHjNbKnOsWlJB2aiRLkJp
 5K4CN7jsxLdgiw1EmvDRqYychgfyRJgXeYF7jHcrlUxix3nzIktTWc9cOM2bp+eYnJ5n
 4rHNaBN+pXSvdXvEVfWwqB5JHPb+wrrhImtc1M5pM1N29DbS5QugQV9OQDbOw7/34fGd
 lIcwu8sIWypXI86LLj2evtQdMZXOo8EFOSOFLVMHf+1gmbHrFa0iWaUiHUrjfn7XIXh4
 JTV3Bx2Zeze92IB8hORzm9UU4/wg8Nh8v5Fbp5TShfVak7jm0XUwJJ3i7a/bD7AisXes
 58+g==
X-Gm-Message-State: AOAM53155QEHy8cc8IcxKKhcKTd+waj3Ra4VHyXV7lW2F6snFXVHl4AQ
 qK30bn7ov42po70owcg1Qr+l3uaISnDdoL4BhetWtlnnDDzAEXdM1I0e90UlTAPTberstilpMlR
 qrHJXWJ+INZ4fxNKYGrRVwvebTOPcuFIZDMvd2JNTGQ==
X-Received: by 2002:a05:6000:160d:: with SMTP id
 u13mr17264324wrb.17.1631602369081; 
 Mon, 13 Sep 2021 23:52:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydJMJ//T5Bhhi3BAF7XAcdjApItEE360NEHybqbdKqRwMeNtO4TK6D9KHStEk2VmTGGDsSJQ==
X-Received: by 2002:a05:6000:160d:: with SMTP id
 u13mr17264290wrb.17.1631602368743; 
 Mon, 13 Sep 2021 23:52:48 -0700 (PDT)
Received: from redhat.com ([2.55.151.134])
 by smtp.gmail.com with ESMTPSA id d7sm9453546wrf.3.2021.09.13.23.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 23:52:48 -0700 (PDT)
Date: Tue, 14 Sep 2021 02:52:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jiang Wang <jiang.wang@bytedance.com>
Subject: Re: [RFC v2 3/5] vhost/vsock: add support for vhost dgram.
Message-ID: <20210914024344-mutt-send-email-mst@kernel.org>
References: <20210914055440.3121004-1-jiang.wang@bytedance.com>
 <20210914055440.3121004-4-jiang.wang@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20210914055440.3121004-4-jiang.wang@bytedance.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: cong.wang@bytedance.com, duanxiongchun@bytedance.com, kvm@vger.kernel.org,
 jiangleetcode@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 virtualization@lists.linux-foundation.org, xieyongji@bytedance.com,
 chaiwen.cc@bytedance.com, stefanha@redhat.com,
 Jakub Kicinski <kuba@kernel.org>, arseny.krasnov@kaspersky.com,
 Ingo Molnar <mingo@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 jhansen@vmware.com
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

On Tue, Sep 14, 2021 at 05:54:36AM +0000, Jiang Wang wrote:
> This patch supports dgram on vhost side, including
> tx and rx. The vhost send packets asynchronously.

how exactly is fairness ensured? what prevents one socket
from monopolizing the device? spec proposal seems to
leave it to the implementation.

> Also, ignore vq errors when vq number is larger than 2,
> so it will be comptaible with old versions.

this needs more explanation.

> Signed-off-by: Jiang Wang <jiang.wang@bytedance.com>



> ---
>  drivers/vhost/vsock.c | 217 ++++++++++++++++++++++++++++++++++++------
>  1 file changed, 189 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> index c79789af0365..a8755cbebd40 100644
> --- a/drivers/vhost/vsock.c
> +++ b/drivers/vhost/vsock.c
> @@ -28,7 +28,10 @@
>   * small pkts.
>   */
>  #define VHOST_VSOCK_PKT_WEIGHT 256
> +#define VHOST_VSOCK_DGRM_MAX_PENDING_PKT 128
>  
> +/* Max wait time in busy poll in microseconds */
> +#define VHOST_VSOCK_BUSY_POLL_TIMEOUT 20

While adding busy polling isn't out of the question, I would think
it should be kept separate from initial dgram support.


>  enum {
>  	VHOST_VSOCK_FEATURES = VHOST_FEATURES |
>  			       (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
> @@ -46,7 +49,7 @@ static DEFINE_READ_MOSTLY_HASHTABLE(vhost_vsock_hash, 8);
>  
>  struct vhost_vsock {
>  	struct vhost_dev dev;
> -	struct vhost_virtqueue vqs[2];
> +	struct vhost_virtqueue vqs[4];
>  
>  	/* Link to global vhost_vsock_hash, writes use vhost_vsock_mutex */
>  	struct hlist_node hash;
> @@ -55,6 +58,11 @@ struct vhost_vsock {
>  	spinlock_t send_pkt_list_lock;
>  	struct list_head send_pkt_list;	/* host->guest pending packets */
>  
> +	spinlock_t dgram_send_pkt_list_lock;
> +	struct list_head dgram_send_pkt_list;	/* host->guest pending packets */
> +	struct vhost_work dgram_send_pkt_work;
> +	int  dgram_used; /*pending packets to be send */

to be sent?

> +
>  	atomic_t queued_replies;
>  
>  	u32 guest_cid;
> @@ -92,10 +100,22 @@ static void
>  vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>  			    struct vhost_virtqueue *vq)
>  {
> -	struct vhost_virtqueue *tx_vq = &vsock->vqs[VSOCK_VQ_TX];
> +	struct vhost_virtqueue *tx_vq;
>  	int pkts = 0, total_len = 0;
>  	bool added = false;
>  	bool restart_tx = false;
> +	spinlock_t *lock;
> +	struct list_head *send_pkt_list;
> +
> +	if (vq == &vsock->vqs[VSOCK_VQ_RX]) {
> +		tx_vq = &vsock->vqs[VSOCK_VQ_TX];
> +		lock = &vsock->send_pkt_list_lock;
> +		send_pkt_list = &vsock->send_pkt_list;
> +	} else {
> +		tx_vq = &vsock->vqs[VSOCK_VQ_DGRAM_TX];
> +		lock = &vsock->dgram_send_pkt_list_lock;
> +		send_pkt_list = &vsock->dgram_send_pkt_list;
> +	}
>  
>  	mutex_lock(&vq->mutex);
>  
> @@ -116,36 +136,48 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>  		size_t iov_len, payload_len;
>  		int head;
>  		bool restore_flag = false;
> +		bool is_dgram = false;
>  
> -		spin_lock_bh(&vsock->send_pkt_list_lock);
> -		if (list_empty(&vsock->send_pkt_list)) {
> -			spin_unlock_bh(&vsock->send_pkt_list_lock);
> +		spin_lock_bh(lock);
> +		if (list_empty(send_pkt_list)) {
> +			spin_unlock_bh(lock);
>  			vhost_enable_notify(&vsock->dev, vq);
>  			break;
>  		}
>  
> -		pkt = list_first_entry(&vsock->send_pkt_list,
> +		pkt = list_first_entry(send_pkt_list,
>  				       struct virtio_vsock_pkt, list);
>  		list_del_init(&pkt->list);
> -		spin_unlock_bh(&vsock->send_pkt_list_lock);
> +		spin_unlock_bh(lock);
> +
> +		if (le16_to_cpu(pkt->hdr.type) == VIRTIO_VSOCK_TYPE_DGRAM)
> +			is_dgram = true;
>  
>  		head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov),
>  					 &out, &in, NULL, NULL);
>  		if (head < 0) {
> -			spin_lock_bh(&vsock->send_pkt_list_lock);
> -			list_add(&pkt->list, &vsock->send_pkt_list);
> -			spin_unlock_bh(&vsock->send_pkt_list_lock);
> +			spin_lock_bh(lock);
> +			list_add(&pkt->list, send_pkt_list);
> +			spin_unlock_bh(lock);
>  			break;
>  		}
>  
>  		if (head == vq->num) {
> -			spin_lock_bh(&vsock->send_pkt_list_lock);
> -			list_add(&pkt->list, &vsock->send_pkt_list);
> -			spin_unlock_bh(&vsock->send_pkt_list_lock);
> +			if (is_dgram) {
> +				virtio_transport_free_pkt(pkt);
> +				vq_err(vq, "Dgram virtqueue is full!");
> +				spin_lock_bh(lock);
> +				vsock->dgram_used--;
> +				spin_unlock_bh(lock);
> +				break;
> +			}
> +			spin_lock_bh(lock);
> +			list_add(&pkt->list, send_pkt_list);
> +			spin_unlock_bh(lock);
>  
>  			/* We cannot finish yet if more buffers snuck in while
> -			 * re-enabling notify.
> -			 */
> +			* re-enabling notify.
> +			*/

looks like you are breaking alignment of comments...

>  			if (unlikely(vhost_enable_notify(&vsock->dev, vq))) {
>  				vhost_disable_notify(&vsock->dev, vq);
>  				continue;
> @@ -156,6 +188,12 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>  		if (out) {
>  			virtio_transport_free_pkt(pkt);
>  			vq_err(vq, "Expected 0 output buffers, got %u\n", out);
> +			if (is_dgram) {
> +				spin_lock_bh(lock);
> +				vsock->dgram_used--;
> +				spin_unlock_bh(lock);
> +			}
> +
>  			break;
>  		}
>  
> @@ -163,6 +201,18 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>  		if (iov_len < sizeof(pkt->hdr)) {
>  			virtio_transport_free_pkt(pkt);
>  			vq_err(vq, "Buffer len [%zu] too small\n", iov_len);
> +			if (is_dgram) {
> +				spin_lock_bh(lock);
> +				vsock->dgram_used--;
> +				spin_unlock_bh(lock);
> +			}
> +			break;
> +		}
> +
> +		if (iov_len < pkt->len - pkt->off &&
> +			vq == &vsock->vqs[VSOCK_VQ_DGRAM_RX]) {
> +			virtio_transport_free_pkt(pkt);
> +			vq_err(vq, "Buffer len [%zu] too small for dgram\n", iov_len);
>  			break;
>  		}
>  
> @@ -199,6 +249,11 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>  		if (nbytes != sizeof(pkt->hdr)) {
>  			virtio_transport_free_pkt(pkt);
>  			vq_err(vq, "Faulted on copying pkt hdr\n");
> +			if (is_dgram) {
> +				spin_lock_bh(lock);
> +				vsock->dgram_used--;
> +				spin_unlock_bh(lock);
> +			}
>  			break;
>  		}
>  
> @@ -224,19 +279,19 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>  		/* If we didn't send all the payload we can requeue the packet
>  		 * to send it with the next available buffer.
>  		 */
> -		if (pkt->off < pkt->len) {
> +		if ((pkt->off < pkt->len)
> +			&& (vq == &vsock->vqs[VSOCK_VQ_RX])) {

&& on the previous line and no need for extra ().

>  			if (restore_flag)
>  				pkt->hdr.flags |= cpu_to_le32(VIRTIO_VSOCK_SEQ_EOR);
> -

no need to drop this imho.

>  			/* We are queueing the same virtio_vsock_pkt to handle
>  			 * the remaining bytes, and we want to deliver it
>  			 * to monitoring devices in the next iteration.
>  			 */
>  			pkt->tap_delivered = false;
>  
> -			spin_lock_bh(&vsock->send_pkt_list_lock);
> -			list_add(&pkt->list, &vsock->send_pkt_list);
> -			spin_unlock_bh(&vsock->send_pkt_list_lock);
> +			spin_lock_bh(lock);
> +			list_add(&pkt->list, send_pkt_list);
> +			spin_unlock_bh(lock);
>  		} else {
>  			if (pkt->reply) {
>  				int val;
> @@ -251,6 +306,11 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>  			}
>  
>  			virtio_transport_free_pkt(pkt);
> +			if (is_dgram) {
> +				spin_lock_bh(lock);
> +				vsock->dgram_used--;
> +				spin_unlock_bh(lock);
> +			}
>  		}
>  	} while(likely(!vhost_exceeds_weight(vq, ++pkts, total_len)));
>  	if (added)
> @@ -274,11 +334,25 @@ static void vhost_transport_send_pkt_work(struct vhost_work *work)
>  	vhost_transport_do_send_pkt(vsock, vq);
>  }
>  
> +static void vhost_transport_dgram_send_pkt_work(struct vhost_work *work)
> +{
> +	struct vhost_virtqueue *vq;
> +	struct vhost_vsock *vsock;
> +
> +	vsock = container_of(work, struct vhost_vsock, dgram_send_pkt_work);
> +	vq = &vsock->vqs[VSOCK_VQ_DGRAM_RX];
> +
> +	vhost_transport_do_send_pkt(vsock, vq);
> +}
> +
>  static int
>  vhost_transport_send_pkt(struct virtio_vsock_pkt *pkt)
>  {
>  	struct vhost_vsock *vsock;
>  	int len = pkt->len;
> +	spinlock_t *lock;
> +	struct list_head *send_pkt_list;
> +	struct vhost_work *work;
>  
>  	rcu_read_lock();
>  
> @@ -290,14 +364,39 @@ vhost_transport_send_pkt(struct virtio_vsock_pkt *pkt)
>  		return -ENODEV;
>  	}
>  
> +	if (le16_to_cpu(pkt->hdr.type) == VIRTIO_VSOCK_TYPE_STREAM ||
> +	     le16_to_cpu(pkt->hdr.type) == VIRTIO_VSOCK_TYPE_SEQPACKET) {
> +		lock = &vsock->send_pkt_list_lock;
> +		send_pkt_list = &vsock->send_pkt_list;
> +		work = &vsock->send_pkt_work;
> +	} else if (le16_to_cpu(pkt->hdr.type) == VIRTIO_VSOCK_TYPE_DGRAM) {
> +		lock = &vsock->dgram_send_pkt_list_lock;
> +		send_pkt_list = &vsock->dgram_send_pkt_list;
> +		work = &vsock->dgram_send_pkt_work;
> +	} else {
> +		rcu_read_unlock();
> +		virtio_transport_free_pkt(pkt);
> +		return -EINVAL;
> +	}
> +
> +
>  	if (pkt->reply)
>  		atomic_inc(&vsock->queued_replies);
>  
> -	spin_lock_bh(&vsock->send_pkt_list_lock);
> -	list_add_tail(&pkt->list, &vsock->send_pkt_list);
> -	spin_unlock_bh(&vsock->send_pkt_list_lock);
> +	spin_lock_bh(lock);
> +	if (le16_to_cpu(pkt->hdr.type) == VIRTIO_VSOCK_TYPE_DGRAM) {
> +		if (vsock->dgram_used  == VHOST_VSOCK_DGRM_MAX_PENDING_PKT)
> +			len = -ENOMEM;
> +		else {
> +			vsock->dgram_used++;
> +			list_add_tail(&pkt->list, send_pkt_list);
> +		}
> +	} else
> +		list_add_tail(&pkt->list, send_pkt_list);
>  
> -	vhost_work_queue(&vsock->dev, &vsock->send_pkt_work);
> +	spin_unlock_bh(lock);
> +
> +	vhost_work_queue(&vsock->dev, work);
>  
>  	rcu_read_unlock();
>  	return len;
> @@ -487,6 +586,18 @@ static bool vhost_transport_seqpacket_allow(u32 remote_cid)
>  	return seqpacket_allow;
>  }
>  
> +static inline unsigned long busy_clock(void)
> +{
> +	return local_clock() >> 10;
> +}
> +
> +static bool vhost_can_busy_poll(unsigned long endtime)
> +{
> +	return likely(!need_resched() && !time_after(busy_clock(), endtime) &&
> +		      !signal_pending(current));
> +}
> +
> +
>  static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
>  {
>  	struct vhost_virtqueue *vq = container_of(work, struct vhost_virtqueue,
> @@ -497,6 +608,8 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
>  	int head, pkts = 0, total_len = 0;
>  	unsigned int out, in;
>  	bool added = false;
> +	unsigned long busyloop_timeout = VHOST_VSOCK_BUSY_POLL_TIMEOUT;
> +	unsigned long endtime;
>  
>  	mutex_lock(&vq->mutex);
>  
> @@ -506,11 +619,14 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
>  	if (!vq_meta_prefetch(vq))
>  		goto out;
>  
> +	endtime = busy_clock() + busyloop_timeout;
>  	vhost_disable_notify(&vsock->dev, vq);
> +	preempt_disable();

That's quite a bit of work done with preempt disabled. Why?
What's going on here?

>  	do {
>  		u32 len;
>  
> -		if (!vhost_vsock_more_replies(vsock)) {
> +		if (vq == &vsock->vqs[VSOCK_VQ_TX]
> +			&& !vhost_vsock_more_replies(vsock)) {
>  			/* Stop tx until the device processes already
>  			 * pending replies.  Leave tx virtqueue
>  			 * callbacks disabled.
> @@ -524,6 +640,11 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
>  			break;
>  
>  		if (head == vq->num) {
> +			if (vhost_can_busy_poll(endtime)) {
> +				cpu_relax();
> +				continue;
> +			}
> +
>  			if (unlikely(vhost_enable_notify(&vsock->dev, vq))) {
>  				vhost_disable_notify(&vsock->dev, vq);
>  				continue;
> @@ -555,6 +676,7 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
>  		total_len += len;
>  		added = true;
>  	} while(likely(!vhost_exceeds_weight(vq, ++pkts, total_len)));
> +	preempt_enable();
>  
>  no_more_replies:
>  	if (added)
> @@ -593,14 +715,30 @@ static int vhost_vsock_start(struct vhost_vsock *vsock)
>  
>  		if (!vhost_vq_access_ok(vq)) {
>  			ret = -EFAULT;
> +			/* when running with old guest and qemu, vq 2 may
> +			 * not exist, so return 0 in this case.

Can't the new stuff be gated by a feature bit as usual?

> +			 */
> +			if (i == 2) {
> +				mutex_unlock(&vq->mutex);
> +				break;
> +			}
>  			goto err_vq;
>  		}
>  
>  		if (!vhost_vq_get_backend(vq)) {
>  			vhost_vq_set_backend(vq, vsock);
>  			ret = vhost_vq_init_access(vq);
> -			if (ret)
> -				goto err_vq;
> +			if (ret) {
> +				mutex_unlock(&vq->mutex);
> +				/* when running with old guest and qemu, vq 2 may
> +				 * not exist, so return 0 in this case.
> +				 */
> +				if (i == 2) {
> +					mutex_unlock(&vq->mutex);
> +					break;
> +				}
> +				goto err;
> +			}
>  		}
>  
>  		mutex_unlock(&vq->mutex);
> @@ -610,6 +748,7 @@ static int vhost_vsock_start(struct vhost_vsock *vsock)
>  	 * let's kick the send worker to send them.
>  	 */
>  	vhost_work_queue(&vsock->dev, &vsock->send_pkt_work);
> +	vhost_work_queue(&vsock->dev, &vsock->dgram_send_pkt_work);
>  
>  	mutex_unlock(&vsock->dev.mutex);
>  	return 0;
> @@ -684,8 +823,14 @@ static int vhost_vsock_dev_open(struct inode *inode, struct file *file)
>  
>  	vqs[VSOCK_VQ_TX] = &vsock->vqs[VSOCK_VQ_TX];
>  	vqs[VSOCK_VQ_RX] = &vsock->vqs[VSOCK_VQ_RX];
> +	vqs[VSOCK_VQ_DGRAM_TX] = &vsock->vqs[VSOCK_VQ_DGRAM_TX];
> +	vqs[VSOCK_VQ_DGRAM_RX] = &vsock->vqs[VSOCK_VQ_DGRAM_RX];
>  	vsock->vqs[VSOCK_VQ_TX].handle_kick = vhost_vsock_handle_tx_kick;
>  	vsock->vqs[VSOCK_VQ_RX].handle_kick = vhost_vsock_handle_rx_kick;
> +	vsock->vqs[VSOCK_VQ_DGRAM_TX].handle_kick =
> +						vhost_vsock_handle_tx_kick;
> +	vsock->vqs[VSOCK_VQ_DGRAM_RX].handle_kick =
> +						vhost_vsock_handle_rx_kick;
>  
>  	vhost_dev_init(&vsock->dev, vqs, ARRAY_SIZE(vsock->vqs),
>  		       UIO_MAXIOV, VHOST_VSOCK_PKT_WEIGHT,
> @@ -695,6 +840,11 @@ static int vhost_vsock_dev_open(struct inode *inode, struct file *file)
>  	spin_lock_init(&vsock->send_pkt_list_lock);
>  	INIT_LIST_HEAD(&vsock->send_pkt_list);
>  	vhost_work_init(&vsock->send_pkt_work, vhost_transport_send_pkt_work);
> +	spin_lock_init(&vsock->dgram_send_pkt_list_lock);
> +	INIT_LIST_HEAD(&vsock->dgram_send_pkt_list);
> +	vhost_work_init(&vsock->dgram_send_pkt_work,
> +			vhost_transport_dgram_send_pkt_work);
> +
>  	return 0;
>  
>  out:
> @@ -769,6 +919,17 @@ static int vhost_vsock_dev_release(struct inode *inode, struct file *file)
>  	}
>  	spin_unlock_bh(&vsock->send_pkt_list_lock);
>  
> +	spin_lock_bh(&vsock->dgram_send_pkt_list_lock);
> +	while (!list_empty(&vsock->dgram_send_pkt_list)) {
> +		struct virtio_vsock_pkt *pkt;
> +
> +		pkt = list_first_entry(&vsock->dgram_send_pkt_list,
> +				struct virtio_vsock_pkt, list);
> +		list_del_init(&pkt->list);
> +		virtio_transport_free_pkt(pkt);
> +	}
> +	spin_unlock_bh(&vsock->dgram_send_pkt_list_lock);
> +
>  	vhost_dev_cleanup(&vsock->dev);
>  	kfree(vsock->dev.vqs);
>  	vhost_vsock_free(vsock);
> @@ -954,7 +1115,7 @@ static int __init vhost_vsock_init(void)
>  	int ret;
>  
>  	ret = vsock_core_register(&vhost_transport.transport,
> -				  VSOCK_TRANSPORT_F_H2G);
> +				  VSOCK_TRANSPORT_F_H2G | VSOCK_TRANSPORT_F_DGRAM);
>  	if (ret < 0)
>  		return ret;
>  	return misc_register(&vhost_vsock_misc);
> -- 
> 2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
