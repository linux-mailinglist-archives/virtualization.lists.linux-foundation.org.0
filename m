Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3717B78D59
	for <lists.virtualization@lfdr.de>; Mon, 29 Jul 2019 16:01:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9E8B51951;
	Mon, 29 Jul 2019 14:01:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 75D4E18F4
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 13:59:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BF2CC2C6
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 13:59:29 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z4so59786104qtc.3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 06:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=iqFgSDsOdyZCFRczb00bD/dVjGAIIMTPIpBxn7IXBR4=;
	b=s4I0DzfB4DBEHlPxI2C7Ueg9WR5dXsGFXFXh6+Q3yVNySpPQdeNlmd1N1bkZKGTYda
	anb+MkFvWyTlfkSU4OWT3XnfakMHEfE5yIJbao1uQbqn+wdhBv0/jTbrkJWBr4zXcObb
	IDANwD7zpiaOJILDg64O29vPZguEIPWUR/vLOivFXNKDQatCmA2XbjL/i9tmi/L9gzlE
	EfD+qYbhRo3rkkrhFYEDqw4nXYoYA3CLMQT2CL+XBB+rT8V1lwX/ccyEV3mQJJ3Sr4LB
	dpD4DtIs7ZfKcOSQkSQW99l7Nu7GBH4GjpZq8SMX7jBlPpNZWpjTQAglEjMEMwWSIAfc
	//Dw==
X-Gm-Message-State: APjAAAVzDYXmTiWAZ6vCrnFXS4cYNIv0Kiyvnpp7YXPoxcK/gP5oK64o
	we9ik1Zio3D/oySL/5RDl7ZaoQ==
X-Google-Smtp-Source: APXvYqya7f0Cp0s/l2MQ/mBXMxHiOdLythBkvJhRckPI6meenN0uORbzR3pHkvKsOkp2VTMZfUkXKg==
X-Received: by 2002:a0c:c96a:: with SMTP id v39mr78289762qvj.121.1564408768811;
	Mon, 29 Jul 2019 06:59:28 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	n27sm20786389qkk.35.2019.07.29.06.59.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 29 Jul 2019 06:59:28 -0700 (PDT)
Date: Mon, 29 Jul 2019 09:59:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4 0/5] vsock/virtio: optimizations to increase the
	throughput
Message-ID: <20190729095743-mutt-send-email-mst@kernel.org>
References: <20190717113030.163499-1-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190717113030.163499-1-sgarzare@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
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

On Wed, Jul 17, 2019 at 01:30:25PM +0200, Stefano Garzarella wrote:
> This series tries to increase the throughput of virtio-vsock with slight
> changes.
> While I was testing the v2 of this series I discovered an huge use of memory,
> so I added patch 1 to mitigate this issue. I put it in this series in order
> to better track the performance trends.

Series:

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Can this go into net-next?


> v4:
> - rebased all patches on current master (conflicts is Patch 4)
> - Patch 1: added Stefan's R-b
> - Patch 3: removed lock when buf_alloc is written [David];
>            moved this patch after "vsock/virtio: reduce credit update messages"
>            to make it clearer
> - Patch 4: vhost_exceeds_weight() is recently introduced, so I've solved some
>            conflicts
> 
> v3: https://patchwork.kernel.org/cover/10970145
> 
> v2: https://patchwork.kernel.org/cover/10938743
> 
> v1: https://patchwork.kernel.org/cover/10885431
> 
> Below are the benchmarks step by step. I used iperf3 [1] modified with VSOCK
> support. As Micheal suggested in the v1, I booted host and guest with 'nosmap'.
> 
> A brief description of patches:
> - Patches 1:   limit the memory usage with an extra copy for small packets
> - Patches 2+3: reduce the number of credit update messages sent to the
>                transmitter
> - Patches 4+5: allow the host to split packets on multiple buffers and use
>                VIRTIO_VSOCK_MAX_PKT_BUF_SIZE as the max packet size allowed
> 
>                     host -> guest [Gbps]
> pkt_size before opt   p 1     p 2+3    p 4+5
> 
> 32         0.032     0.030    0.048    0.051
> 64         0.061     0.059    0.108    0.117
> 128        0.122     0.112    0.227    0.234
> 256        0.244     0.241    0.418    0.415
> 512        0.459     0.466    0.847    0.865
> 1K         0.927     0.919    1.657    1.641
> 2K         1.884     1.813    3.262    3.269
> 4K         3.378     3.326    6.044    6.195
> 8K         5.637     5.676   10.141   11.287
> 16K        8.250     8.402   15.976   16.736
> 32K       13.327    13.204   19.013   20.515
> 64K       21.241    21.341   20.973   21.879
> 128K      21.851    22.354   21.816   23.203
> 256K      21.408    21.693   21.846   24.088
> 512K      21.600    21.899   21.921   24.106
> 
>                     guest -> host [Gbps]
> pkt_size before opt   p 1     p 2+3    p 4+5
> 
> 32         0.045     0.046    0.057    0.057
> 64         0.089     0.091    0.103    0.104
> 128        0.170     0.179    0.192    0.200
> 256        0.364     0.351    0.361    0.379
> 512        0.709     0.699    0.731    0.790
> 1K         1.399     1.407    1.395    1.427
> 2K         2.670     2.684    2.745    2.835
> 4K         5.171     5.199    5.305    5.451
> 8K         8.442     8.500   10.083    9.941
> 16K       12.305    12.259   13.519   15.385
> 32K       11.418    11.150   11.988   24.680
> 64K       10.778    10.659   11.589   35.273
> 128K      10.421    10.339   10.939   40.338
> 256K      10.300     9.719   10.508   36.562
> 512K       9.833     9.808   10.612   35.979
> 
> As Stefan suggested in the v1, I measured also the efficiency in this way:
>     efficiency = Mbps / (%CPU_Host + %CPU_Guest)
> 
> The '%CPU_Guest' is taken inside the VM. I know that it is not the best way,
> but it's provided for free from iperf3 and could be an indication.
> 
>         host -> guest efficiency [Mbps / (%CPU_Host + %CPU_Guest)]
> pkt_size before opt   p 1     p 2+3    p 4+5
> 
> 32         0.35      0.45     0.79     1.02
> 64         0.56      0.80     1.41     1.54
> 128        1.11      1.52     3.03     3.12
> 256        2.20      2.16     5.44     5.58
> 512        4.17      4.18    10.96    11.46
> 1K         8.30      8.26    20.99    20.89
> 2K        16.82     16.31    39.76    39.73
> 4K        30.89     30.79    74.07    75.73
> 8K        53.74     54.49   124.24   148.91
> 16K       80.68     83.63   200.21   232.79
> 32K      132.27    132.52   260.81   357.07
> 64K      229.82    230.40   300.19   444.18
> 128K     332.60    329.78   331.51   492.28
> 256K     331.06    337.22   339.59   511.59
> 512K     335.58    328.50   331.56   504.56
> 
>         guest -> host efficiency [Mbps / (%CPU_Host + %CPU_Guest)]
> pkt_size before opt   p 1     p 2+3    p 4+5
> 
> 32         0.43      0.43     0.53     0.56
> 64         0.85      0.86     1.04     1.10
> 128        1.63      1.71     2.07     2.13
> 256        3.48      3.35     4.02     4.22
> 512        6.80      6.67     7.97     8.63
> 1K        13.32     13.31    15.72    15.94
> 2K        25.79     25.92    30.84    30.98
> 4K        50.37     50.48    58.79    59.69
> 8K        95.90     96.15   107.04   110.33
> 16K      145.80    145.43   143.97   174.70
> 32K      147.06    144.74   146.02   282.48
> 64K      145.25    143.99   141.62   406.40
> 128K     149.34    146.96   147.49   489.34
> 256K     156.35    149.81   152.21   536.37
> 512K     151.65    150.74   151.52   519.93
> 
> [1] https://github.com/stefano-garzarella/iperf/
> 
> Stefano Garzarella (5):
>   vsock/virtio: limit the memory used per-socket
>   vsock/virtio: reduce credit update messages
>   vsock/virtio: fix locking in virtio_transport_inc_tx_pkt()
>   vhost/vsock: split packets to send using multiple buffers
>   vsock/virtio: change the maximum packet size allowed
> 
>  drivers/vhost/vsock.c                   | 68 ++++++++++++-----
>  include/linux/virtio_vsock.h            |  4 +-
>  net/vmw_vsock/virtio_transport.c        |  1 +
>  net/vmw_vsock/virtio_transport_common.c | 99 ++++++++++++++++++++-----
>  4 files changed, 134 insertions(+), 38 deletions(-)
> 
> -- 
> 2.20.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
