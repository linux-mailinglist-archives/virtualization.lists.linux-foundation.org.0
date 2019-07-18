Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FA26CA49
	for <lists.virtualization@lfdr.de>; Thu, 18 Jul 2019 09:50:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 52A33163B;
	Thu, 18 Jul 2019 07:50:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 25A55E1E
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 07:50:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 985D125A
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 07:50:19 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z1so27496644wru.13
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 00:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wKtb4eNPTM8gmdHfl+ucaMw83dCy0zFFLk8YD1DYgwA=;
	b=dkmDpBUhMI6+NMriBw1fUeUqOeRUpFc2PcBVd53Syo7GXf6asVFpPBXccCb/sysoSb
	ycitqe9EGEm3Zea0nUNqh/1pc+wlOVKUTLpzZ2eWhmX+pspMwuPoh8iQo1iSTWMr5Z78
	bwMLVQSX8oVnWAlwxxeHYZuXlPTqhNlpoFjHG3jFq7szlcUltaFAhJZNTJzdTN4IpgHp
	nHqxQap/+z+RJz6k003j047i4rTqTWwA6ZQGVBsA9a+P2p4A1tEo2n6vcnen9HlJLf6x
	nKlOxeZF9BHMsrgHDjA8eKFLRr0AqgTFO4nMKmT7OzOOY5zU8njReWNiAlsvZfQDKX3p
	xY2w==
X-Gm-Message-State: APjAAAVM6MDT7WzRUouPox8+FLXzHJER633JOoIooVFoDICW/2T6WrFd
	yviJRr+FbdnE3ZmIJzsIxmmoGQ==
X-Google-Smtp-Source: APXvYqwhtjfQPOZEcza8kvYxdthj0IlRokH67HGXPivPJMSfA2tEdGbKSTgLCbWYotwEWVmgu0HbJw==
X-Received: by 2002:adf:cf0d:: with SMTP id o13mr69099wrj.291.1563436218259;
	Thu, 18 Jul 2019 00:50:18 -0700 (PDT)
Received: from steredhat ([5.170.38.133]) by smtp.gmail.com with ESMTPSA id
	b2sm33517958wrp.72.2019.07.18.00.50.16
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 00:50:17 -0700 (PDT)
Date: Thu, 18 Jul 2019 09:50:14 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 4/5] vhost/vsock: split packets to send using multiple
	buffers
Message-ID: <CAGxU2F45v40qAOHkm1Hk2E69gCS0UwVgS5NS+tDXXuzdF4EixA@mail.gmail.com>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-5-sgarzare@redhat.com>
	<20190717105336-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190717105336-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716
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

On Wed, Jul 17, 2019 at 4:55 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Jul 17, 2019 at 01:30:29PM +0200, Stefano Garzarella wrote:
> > If the packets to sent to the guest are bigger than the buffer
> > available, we can split them, using multiple buffers and fixing
> > the length in the packet header.
> > This is safe since virtio-vsock supports only stream sockets.
> >
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>
> So how does it work right now? If an app
> does sendmsg with a 64K buffer and the other
> side publishes 4K buffers - does it just stall?

Before this series, the 64K (or bigger) user messages was split in 4K packets
(fixed in the code) and queued in an internal list for the TX worker.

After this series, we will queue up to 64K packets and then it will be split in
the TX worker, depending on the size of the buffers available in the
vring. (The idea was to allow EWMA or a configuration of the buffers size, but
for now we postponed it)

Note: virtio-vsock only supports stream socket for now.

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
