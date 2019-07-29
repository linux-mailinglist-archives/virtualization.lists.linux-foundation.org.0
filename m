Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F4878F87
	for <lists.virtualization@lfdr.de>; Mon, 29 Jul 2019 17:39:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id EFF3619A1;
	Mon, 29 Jul 2019 15:39:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 50E491971
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 15:37:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B49CB604
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 15:37:00 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c2so59152339wrm.8
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 08:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kbdqHLDZjC9a+s2gzn3LKNYZtrgZuml85rJixr3NhMA=;
	b=mmdYHp56RH/PRqwxHikcN3PqxgvR1xGlyAJSTgdxjBOHYD4aIoFTLRjFdK+Oa5nWXb
	eR9SUVYQhDttKTerr6R0s1BpXGv2dmevCpJnQPjecyZCWGJgvfQEtPxmSSpwVR5ggoxd
	/wOJ6aZccm+pYwDuIv7o5jucP8z3AFBh7Jp5QPFtjTC1nqnDpX3pXKBx7eTHintOUNs5
	BeBV4i04oGCTn16HxgQddKHMXkxXLch+e1EWUfLRnBn4swTIVDN8Z7T4SHvEqpKd2YKj
	oQzE1zuSMuGUi19jtmfoMycMp/cowqe4Pfir1xQiH7gt4WPm5it5rv7QM4jDCILFjaq2
	Sz/g==
X-Gm-Message-State: APjAAAWHjxgYqyb6qhjr4g7xpThS9J6J0GYTy7w1fB7fNBJo8v0e114P
	vEaMV35DKID36YMv8uLip29waA==
X-Google-Smtp-Source: APXvYqyIgEmmE4cqBkrJP3fc56zTUtO2PgG0o7WjOjV8vL0usOvWpBwWKxfFJk/mZ144VJ835dKMgA==
X-Received: by 2002:adf:e705:: with SMTP id c5mr73459454wrm.270.1564414619334; 
	Mon, 29 Jul 2019 08:36:59 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
	[79.13.201.122]) by smtp.gmail.com with ESMTPSA id
	p63sm13455498wmp.45.2019.07.29.08.36.58
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 29 Jul 2019 08:36:58 -0700 (PDT)
Date: Mon, 29 Jul 2019 17:36:56 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v4 1/5] vsock/virtio: limit the memory used per-socket
Message-ID: <20190729153656.zk4q4rob5oi6iq7l@steredhat>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-2-sgarzare@redhat.com>
	<20190729095956-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729095956-mutt-send-email-mst@kernel.org>
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

On Mon, Jul 29, 2019 at 10:04:29AM -0400, Michael S. Tsirkin wrote:
> On Wed, Jul 17, 2019 at 01:30:26PM +0200, Stefano Garzarella wrote:
> > Since virtio-vsock was introduced, the buffers filled by the host
> > and pushed to the guest using the vring, are directly queued in
> > a per-socket list. These buffers are preallocated by the guest
> > with a fixed size (4 KB).
> > 
> > The maximum amount of memory used by each socket should be
> > controlled by the credit mechanism.
> > The default credit available per-socket is 256 KB, but if we use
> > only 1 byte per packet, the guest can queue up to 262144 of 4 KB
> > buffers, using up to 1 GB of memory per-socket. In addition, the
> > guest will continue to fill the vring with new 4 KB free buffers
> > to avoid starvation of other sockets.
> > 
> > This patch mitigates this issue copying the payload of small
> > packets (< 128 bytes) into the buffer of last packet queued, in
> > order to avoid wasting memory.
> > 
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> 
> This is good enough for net-next, but for net I think we
> should figure out how to address the issue completely.
> Can we make the accounting precise? What happens to
> performance if we do?
> 

In order to do more precise accounting maybe we can use the buffer size,
instead of payload size when we update the credit available.
In this way, the credit available for each socket will reflect the memory
actually used.

I should check better, because I'm not sure what happen if the peer sees
1KB of space available, then it sends 1KB of payload (using a 4KB
buffer).

The other option is to copy each packet in a new buffer like I did in
the v2 [2], but this forces us to make a copy for each packet that does
not fill the entire buffer, perhaps too expensive.

[2] https://patchwork.kernel.org/patch/10938741/


Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
