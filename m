Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C5779045
	for <lists.virtualization@lfdr.de>; Mon, 29 Jul 2019 18:04:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E418B1A20;
	Mon, 29 Jul 2019 16:04:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C80461738
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 16:01:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4E5486CE
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 16:01:44 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id a186so39538326vsd.7
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Jul 2019 09:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=F22IOpvGzuwCs+Et2Wm6c0mIYlOT2lCTjpD6ddOFTas=;
	b=KygOC4Eau+ppRcsDr8u+ConEHrVjj5f7oUU8LMTpixKxYOZwsPHeizN09gK0FDfXEv
	9j+SsBZnE7qvRZX9yIEboa4mhvaYIOsXaw+kBOPJ4NW7a6xU6D7s1kBIS7tKq2BfulQ6
	uEpOVhxL4U5H0vfE3zcjmFFcZERQZdv02fd4WNxRIUVB46L9TRags+gOumpZ2q311sxm
	ggi54P5z7izjg0ZfsK3pGU7cn7NqK5F2DVJpEZqYzqc5n4DLMBLSzo2kqTDQ5XCCbXSq
	ULCAYYSO1g9C9+3jwZnBJsyJwrTMJScN8BKWYPduJIeFBBn7PwDdDINLvvSS+k2SbQ7m
	g6Fg==
X-Gm-Message-State: APjAAAVpI79pPCaXpx/BiRhVGgxN3iEY13i6jJnUZZr7KulPmX/kHsep
	qz3VijUwRUthACXbv1J7LzhvjA==
X-Google-Smtp-Source: APXvYqyL15XGjOVMiK+yH1llx7jj3/of29D33b3O3EZv3RPYANUrqdhIF1TDRY/qzMWca1WS02erEA==
X-Received: by 2002:a67:89c7:: with SMTP id l190mr68587815vsd.13.1564416103428;
	Mon, 29 Jul 2019 09:01:43 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	t200sm25600663vke.5.2019.07.29.09.01.39
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 29 Jul 2019 09:01:42 -0700 (PDT)
Date: Mon, 29 Jul 2019 12:01:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v4 1/5] vsock/virtio: limit the memory used per-socket
Message-ID: <20190729115904-mutt-send-email-mst@kernel.org>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190717113030.163499-2-sgarzare@redhat.com>
	<20190729095956-mutt-send-email-mst@kernel.org>
	<20190729153656.zk4q4rob5oi6iq7l@steredhat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729153656.zk4q4rob5oi6iq7l@steredhat>
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

On Mon, Jul 29, 2019 at 05:36:56PM +0200, Stefano Garzarella wrote:
> On Mon, Jul 29, 2019 at 10:04:29AM -0400, Michael S. Tsirkin wrote:
> > On Wed, Jul 17, 2019 at 01:30:26PM +0200, Stefano Garzarella wrote:
> > > Since virtio-vsock was introduced, the buffers filled by the host
> > > and pushed to the guest using the vring, are directly queued in
> > > a per-socket list. These buffers are preallocated by the guest
> > > with a fixed size (4 KB).
> > > 
> > > The maximum amount of memory used by each socket should be
> > > controlled by the credit mechanism.
> > > The default credit available per-socket is 256 KB, but if we use
> > > only 1 byte per packet, the guest can queue up to 262144 of 4 KB
> > > buffers, using up to 1 GB of memory per-socket. In addition, the
> > > guest will continue to fill the vring with new 4 KB free buffers
> > > to avoid starvation of other sockets.
> > > 
> > > This patch mitigates this issue copying the payload of small
> > > packets (< 128 bytes) into the buffer of last packet queued, in
> > > order to avoid wasting memory.
> > > 
> > > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > 
> > This is good enough for net-next, but for net I think we
> > should figure out how to address the issue completely.
> > Can we make the accounting precise? What happens to
> > performance if we do?
> > 
> 
> In order to do more precise accounting maybe we can use the buffer size,
> instead of payload size when we update the credit available.
> In this way, the credit available for each socket will reflect the memory
> actually used.
> 
> I should check better, because I'm not sure what happen if the peer sees
> 1KB of space available, then it sends 1KB of payload (using a 4KB
> buffer).
> The other option is to copy each packet in a new buffer like I did in
> the v2 [2], but this forces us to make a copy for each packet that does
> not fill the entire buffer, perhaps too expensive.
> 
> [2] https://patchwork.kernel.org/patch/10938741/
> 

So one thing we can easily do is to under-report the
available credit. E.g. if we copy up to 256bytes,
then report just 256bytes for every buffer in the queue.


> 
> Thanks,
> Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
