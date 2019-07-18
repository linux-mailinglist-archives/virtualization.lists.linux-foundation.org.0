Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B61C46CA59
	for <lists.virtualization@lfdr.de>; Thu, 18 Jul 2019 09:52:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CD134163E;
	Thu, 18 Jul 2019 07:52:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F07721631
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 07:52:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 88DBB12E
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 07:52:51 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id 31so27586639wrm.1
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 00:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=rq+59r0RojlnTnigSljktyDPpoq1gf7r9wfF77O5XwQ=;
	b=rmKnFxZoBw8GBvT5euhlyIDv4PQtfzG8/beGAakYPkxZMqxtUePsjjhirkwFVMPSvB
	05v0AB29UfcbsVlyg8zQH7b+aDqfP6u4tbd7NAEe6pPJgS9O20QNSQTNjXWnxhOdDvpA
	9iOi7t4Yp2q3fw49yTNWh2A2DBSQNjnM+2KjBgU+iBtKK4tlIhNlPUErkvY6HTduFonr
	NrlxWufRby8sNZ5w3CZKvdUMz2kbk8iOxgRlT3rNeMsU3TMUzlW1vMn2EYfK/PgBpUed
	HApqxrTtxZmMWVMF9yGZycJKlO/pxVQQnf3DucK2Jgpm9MHuCTrJZ0SM+AlnxUXj6K99
	reeg==
X-Gm-Message-State: APjAAAXRDthBeeauGHXRYkTMLrgqMQlAAc4g0HblIMrnwycbr1QWrz0j
	y1ffsI4mk4W8gFvFcKcDmWh5Gg==
X-Google-Smtp-Source: APXvYqyhGa0Qg+pWCOm2tSbKxPMpCW9SMZnBKSICCaQYntmM+FchtqJbWROJ8PfSDyCUWGkgpEQWRw==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr50042800wrm.235.1563436370235; 
	Thu, 18 Jul 2019 00:52:50 -0700 (PDT)
Received: from steredhat ([5.170.38.133])
	by smtp.gmail.com with ESMTPSA id 91sm54324185wrp.3.2019.07.18.00.52.48
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 00:52:49 -0700 (PDT)
Date: Thu, 18 Jul 2019 09:52:41 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 5/5] vsock/virtio: change the maximum packet size
	allowed
Message-ID: <CAGxU2F5ybg1_8VhS=COMnxSKC4AcW4ZagYwNMi==d6-rNPgzsg@mail.gmail.com>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-6-sgarzare@redhat.com>
	<20190717105703-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190717105703-mutt-send-email-mst@kernel.org>
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

On Wed, Jul 17, 2019 at 5:00 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Jul 17, 2019 at 01:30:30PM +0200, Stefano Garzarella wrote:
> > Since now we are able to split packets, we can avoid limiting
> > their sizes to VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE.
> > Instead, we can use VIRTIO_VSOCK_MAX_PKT_BUF_SIZE as the max
> > packet size.
> >
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>
>
> OK so this is kind of like GSO where we are passing
> 64K packets to the vsock and then split at the
> low level.

Exactly, something like that in the Host->Guest path, instead in the
Guest->Host we use the entire 64K packet.

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
