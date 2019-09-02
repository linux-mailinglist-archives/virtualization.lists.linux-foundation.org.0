Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F20BFA5A02
	for <lists.virtualization@lfdr.de>; Mon,  2 Sep 2019 17:02:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 72867D39;
	Mon,  2 Sep 2019 15:01:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 34E17D39
	for <virtualization@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 15:01:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C2BD8709
	for <virtualization@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 15:01:57 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
	[209.85.160.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B00681DE3
	for <virtualization@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 15:01:57 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id u7so5164775qtg.7
	for <virtualization@lists.linux-foundation.org>;
	Mon, 02 Sep 2019 08:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=3eUULgrjIJg0a0dnW4SKY8dVu/LzudzFut/uYLoCkM0=;
	b=JQuccXJJ67OsOvDJHkcv0mNjbo3YxLqFX646qnLvLEoOejBXtsyIkjordGiznb3+19
	PEOa9CkRQpjFcM0tBwu2ORawM70xL1GCHaRhZIqYOkGDYrM6SLGdidagoYaQJO4v8XBM
	CHBWCyQT5qsd4f/PuHqueVFN25cOcxfDbugB8+DUBJdqgZyv30pqmKqW1DK5YAZ6VA1x
	sAl5M1FwrbUpuBA7txUoQK6S28qGe6mfnEVaOr67zNNp2PGaqnj1iNy3CbugrmW7Ut1f
	adMA1sMUe6RLzn5CSeo9IU94omY+QYvCvST1Z4KRdNOD5gqC1O0g/isTLd+krYuTehbk
	bP0g==
X-Gm-Message-State: APjAAAXBa1OgUrUHvZwF6To+WwJXJHqtQgAtPbmKaXX//+JDVbYTmRck
	F+FWDgv5zXwrIDWToBBydvb5Edmw2aHItfcg7qV9aKuyFWQmUxw5xLmkbv/bGJqhLUOqPgSiQW+
	pJ+vLQjn7HJkrpHUeXXNsNO/eYk98vvbLc9+NDbyaKQ==
X-Received: by 2002:ac8:750e:: with SMTP id u14mr28909656qtq.282.1567436516413;
	Mon, 02 Sep 2019 08:01:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzukZkbHkn1xgGj19iRwoWTZ0EUi0+QeIBA4njsNuROpWrZ/97Kw7ZdMd2ZPPImX2/1Fxx4Fg==
X-Received: by 2002:ac8:750e:: with SMTP id u14mr28909631qtq.282.1567436516228;
	Mon, 02 Sep 2019 08:01:56 -0700 (PDT)
Received: from redhat.com (bzq-79-180-62-110.red.bezeqint.net. [79.180.62.110])
	by smtp.gmail.com with ESMTPSA id
	o11sm4589103qkm.105.2019.09.02.08.01.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Sep 2019 08:01:55 -0700 (PDT)
Date: Mon, 2 Sep 2019 11:01:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: ? jiang <jiangkidd@hotmail.com>
Subject: Re: [PATCH v3] virtio-net: lower min ring num_free for efficiency
Message-ID: <20190902110038-mutt-send-email-mst@kernel.org>
References: <BYAPR14MB32059DD9439280B66B532351A6AB0@BYAPR14MB3205.namprd14.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR14MB32059DD9439280B66B532351A6AB0@BYAPR14MB3205.namprd14.prod.outlook.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "xdp-newbies@vger.kernel.org" <xdp-newbies@vger.kernel.org>,
	"songliubraving@fb.com" <songliubraving@fb.com>,
	"jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
	"hawk@kernel.org" <hawk@kernel.org>,
	"daniel@iogearbox.net" <daniel@iogearbox.net>,
	"jiangran.jr@alibaba-inc.com" <jiangran.jr@alibaba-inc.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"john.fastabend@gmail.com" <john.fastabend@gmail.com>,
	"ast@kernel.org" <ast@kernel.org>, "kafai@fb.com" <kafai@fb.com>,
	"yhs@fb.com" <yhs@fb.com>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Tue, Aug 20, 2019 at 02:51:23AM +0000, ? jiang wrote:
> This change lowers ring buffer reclaim threshold from 1/2*queue to budget
> for better performance. According to our test with qemu + dpdk, packet
> dropping happens when the guest is not able to provide free buffer in
> avail ring timely with default 1/2*queue. The value in the patch has been
> tested and does show better performance.
> 
> Test setup: iperf3 to generate packets to guest (total 30mins, pps 400k, UDP)
> avg packets drop before: 2842
> avg packets drop after: 360(-87.3%)
> 
> Further, current code suffers from a starvation problem: the amount of
> work done by try_fill_recv is not bounded by the budget parameter, thus
> (with large queues) once in a while userspace gets blocked for a long
> time while queue is being refilled. Trigger refills earlier to make sure
> the amount of work to do is limited.
> 
> Signed-off-by: jiangkidd <jiangkidd@hotmail.com>
> Acked-by: Jason Wang <jasowang@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>


Dave, could you merge this please?

Either net or net-next at your discretion.

> ---
>  drivers/net/virtio_net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 0d4115c9e20b..bc08be7925eb 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -1331,7 +1331,7 @@ static int virtnet_receive(struct receive_queue *rq, int budget,
>  		}
>  	}
>  
> -	if (rq->vq->num_free > virtqueue_get_vring_size(rq->vq) / 2) {
> +	if (rq->vq->num_free > min((unsigned int)budget, virtqueue_get_vring_size(rq->vq)) / 2) {
>  		if (!try_fill_recv(vi, rq, GFP_ATOMIC))
>  			schedule_delayed_work(&vi->refill, 0);
>  	}
> -- 
> 2.11.0
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
