Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8721A729
	for <lists.virtualization@lfdr.de>; Sat, 11 May 2019 10:27:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A587EAEF;
	Sat, 11 May 2019 08:27:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 12C6E9D
	for <virtualization@lists.linux-foundation.org>;
	Sat, 11 May 2019 08:27:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 642AE1FB
	for <virtualization@lists.linux-foundation.org>;
	Sat, 11 May 2019 08:27:10 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id f8so460782wrt.1
	for <virtualization@lists.linux-foundation.org>;
	Sat, 11 May 2019 01:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=SdcIkrLxlvfbUBZr0Qh6I0nrjoSmAfdYaMwVRnCWFzs=;
	b=SvhrfxCJi88Ajhgq1Nz69LQZWJzBG6UmVFU8L8G0NYeNK28FiMxPaXmXdKIDGHnE7I
	g0LpMuukrlSbO9WXiHdiwI9luq8Hx4WesxnY4670aHhmtRXM3pX5U8rAzmDfJJhwLUJU
	A8HSMnO4k3UtuGMHDrmJl1pxDEVAUoEE0RHxIr03ptEysDAQOXfldxa1ggaDBehsjhp5
	8V/DEM5Krb5s1KlExBzRENqAlxWvokT88NfvhBfisA8au95UacYds59FlCHeVYUnqirW
	VseyIOvWLgAafVfXLxoA68/qxuSfTJTJQjYKwe67Ytikd/VdSD8HB8I2Blo40Er3CrDb
	w76A==
X-Gm-Message-State: APjAAAWoEu+0fDC6J8DMFoI6n7MFSRF3esSdT5NGFxKM+baDXHwEUEro
	sIQ0J4PohuXicux7iGFUhSmbRA==
X-Google-Smtp-Source: APXvYqyj/9N4bztXCrHILbAbwp3dJCqyNjuLPc0pwjnIPNQl6TcYclEpkJFlN8NEOxoqcXldXr0PfA==
X-Received: by 2002:a5d:49c1:: with SMTP id t1mr10376967wrs.247.1557563228981; 
	Sat, 11 May 2019 01:27:08 -0700 (PDT)
Received: from steredhat.homenet.telecomitalia.it
	(host151-251-static.12-87-b.business.telecomitalia.it.
	[87.12.251.151]) by smtp.gmail.com with ESMTPSA id
	g10sm8043541wrw.80.2019.05.11.01.27.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 11 May 2019 01:27:08 -0700 (PDT)
Date: Sat, 11 May 2019 10:27:05 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v2 2/8] vsock/virtio: free packets during the socket
	release
Message-ID: <20190511082705.t62d3rfbgibc4zxi@steredhat.homenet.telecomitalia.it>
References: <20190510125843.95587-1-sgarzare@redhat.com>
	<20190510125843.95587-3-sgarzare@redhat.com>
	<20190510.152008.1902268386064871188.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190510.152008.1902268386064871188.davem@davemloft.net>
User-Agent: NeoMutt/20180716
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

On Fri, May 10, 2019 at 03:20:08PM -0700, David Miller wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> Date: Fri, 10 May 2019 14:58:37 +0200
> 
> > @@ -827,12 +827,20 @@ static bool virtio_transport_close(struct vsock_sock *vsk)
> >  
> >  void virtio_transport_release(struct vsock_sock *vsk)
> >  {
> > +	struct virtio_vsock_sock *vvs = vsk->trans;
> > +	struct virtio_vsock_buf *buf;
> >  	struct sock *sk = &vsk->sk;
> >  	bool remove_sock = true;
> >  
> >  	lock_sock(sk);
> >  	if (sk->sk_type == SOCK_STREAM)
> >  		remove_sock = virtio_transport_close(vsk);
> > +	while (!list_empty(&vvs->rx_queue)) {
> > +		buf = list_first_entry(&vvs->rx_queue,
> > +				       struct virtio_vsock_buf, list);
> 
> Please use list_for_each_entry_safe().

Thanks for the review, I'll change it in the v3.

Cheers,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
