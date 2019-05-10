Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 502CE1A532
	for <lists.virtualization@lfdr.de>; Sat, 11 May 2019 00:20:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 740B1F69;
	Fri, 10 May 2019 22:20:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 87322F69
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 22:20:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 35661875
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 22:20:10 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d8])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id 619BA133E975E;
	Fri, 10 May 2019 15:20:09 -0700 (PDT)
Date: Fri, 10 May 2019 15:20:08 -0700 (PDT)
Message-Id: <20190510.152008.1902268386064871188.davem@davemloft.net>
To: sgarzare@redhat.com
Subject: Re: [PATCH v2 2/8] vsock/virtio: free packets during the socket
	release
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190510125843.95587-3-sgarzare@redhat.com>
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-3-sgarzare@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Fri, 10 May 2019 15:20:09 -0700 (PDT)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, stefanha@redhat.com
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

From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 10 May 2019 14:58:37 +0200

> @@ -827,12 +827,20 @@ static bool virtio_transport_close(struct vsock_sock *vsk)
>  
>  void virtio_transport_release(struct vsock_sock *vsk)
>  {
> +	struct virtio_vsock_sock *vvs = vsk->trans;
> +	struct virtio_vsock_buf *buf;
>  	struct sock *sk = &vsk->sk;
>  	bool remove_sock = true;
>  
>  	lock_sock(sk);
>  	if (sk->sk_type == SOCK_STREAM)
>  		remove_sock = virtio_transport_close(vsk);
> +	while (!list_empty(&vvs->rx_queue)) {
> +		buf = list_first_entry(&vvs->rx_queue,
> +				       struct virtio_vsock_buf, list);

Please use list_for_each_entry_safe().
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
