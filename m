Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B786BEAF
	for <lists.virtualization@lfdr.de>; Wed, 17 Jul 2019 17:00:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1FE10D80;
	Wed, 17 Jul 2019 15:00:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9C0CAB88
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 15:00:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4F5F9879
	for <virtualization@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 15:00:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4111308FEC0;
	Wed, 17 Jul 2019 14:59:59 +0000 (UTC)
Received: from redhat.com (ovpn-125-71.rdu2.redhat.com [10.10.125.71])
	by smtp.corp.redhat.com (Postfix) with SMTP id 7012E608A6;
	Wed, 17 Jul 2019 14:59:53 +0000 (UTC)
Date: Wed, 17 Jul 2019 10:59:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4 5/5] vsock/virtio: change the maximum packet size
	allowed
Message-ID: <20190717105703-mutt-send-email-mst@kernel.org>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-6-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190717113030.163499-6-sgarzare@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 17 Jul 2019 14:59:59 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Wed, Jul 17, 2019 at 01:30:30PM +0200, Stefano Garzarella wrote:
> Since now we are able to split packets, we can avoid limiting
> their sizes to VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE.
> Instead, we can use VIRTIO_VSOCK_MAX_PKT_BUF_SIZE as the max
> packet size.
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>


OK so this is kind of like GSO where we are passing
64K packets to the vsock and then split at the
low level.


> ---
>  net/vmw_vsock/virtio_transport_common.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> index 56fab3f03d0e..94cc0fa3e848 100644
> --- a/net/vmw_vsock/virtio_transport_common.c
> +++ b/net/vmw_vsock/virtio_transport_common.c
> @@ -181,8 +181,8 @@ static int virtio_transport_send_pkt_info(struct vsock_sock *vsk,
>  	vvs = vsk->trans;
>  
>  	/* we can send less than pkt_len bytes */
> -	if (pkt_len > VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE)
> -		pkt_len = VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE;
> +	if (pkt_len > VIRTIO_VSOCK_MAX_PKT_BUF_SIZE)
> +		pkt_len = VIRTIO_VSOCK_MAX_PKT_BUF_SIZE;
>  
>  	/* virtio_transport_get_credit might return less than pkt_len credit */
>  	pkt_len = virtio_transport_get_credit(vvs, pkt_len);
> -- 
> 2.20.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
