Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0812FA5F
	for <lists.virtualization@lfdr.de>; Thu, 30 May 2019 12:37:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5A468387F;
	Thu, 30 May 2019 10:37:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F3636385D
	for <virtualization@lists.linux-foundation.org>;
	Thu, 30 May 2019 10:27:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7A2CF880
	for <virtualization@lists.linux-foundation.org>;
	Thu, 30 May 2019 10:27:45 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 15so3479921wmg.5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 30 May 2019 03:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ufaJ69bV1ZdV2vK3Yvd7HZfDeRwHgRdBfrRRr7OPOt8=;
	b=GQBg0mGUi8gvnHURWmSmZmB+FqrX/g1qhAX1pOdcEGBQK0VDQ6uoh4/Y6HOLSQdlKu
	GOFxtHgrUd0ckduo8WFdNSDayQf3Rl0MWceLcw91aDRKi+xW1EKweINGbWDqoId/gv6Y
	wnnseloMgTUPO8g5GMgNUIot2iret2Ohte309FUk9HIoHrG99Q3gYR0IvHQS4CytbefV
	sEqcvyJeln7JW8JwljggjqIxmEnYbbMlHeKHXqBdD7axGjgRfLoCbHfcJMlp0iOyGbwT
	Z7Qk9BnM+h3HMPlnpZBw256TFNK8QiT8jjMlHSoG1+v3tRdaXgJVEtXImtjDbBRVHuAR
	TAfA==
X-Gm-Message-State: APjAAAWsuzo+184WgvNJUHuTpg/p/sqF2yBUNUvBut43r9KC/qLz2V7q
	m8qpsa0sEcHrnpur7iEZhkhb4A==
X-Google-Smtp-Source: APXvYqwCZoROfm1dwQ0BbuZ4fQ3gtir9ydTTXaC6tZ+Z2VET1TLknia55mcrtyiStuIylOJjK8wEIA==
X-Received: by 2002:a05:600c:1051:: with SMTP id
	17mr1836219wmx.10.1559212064154; 
	Thu, 30 May 2019 03:27:44 -0700 (PDT)
Received: from steredhat.homenet.telecomitalia.it
	(host253-229-dynamic.248-95-r.retail.telecomitalia.it.
	[95.248.229.253])
	by smtp.gmail.com with ESMTPSA id f3sm1958585wre.93.2019.05.30.03.27.42
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 30 May 2019 03:27:43 -0700 (PDT)
Date: Thu, 30 May 2019 12:27:40 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 1/4] vsock/virtio: fix locking around 'the_virtio_vsock'
Message-ID: <20190530102740.nyg6akggvy2asikt@steredhat.homenet.telecomitalia.it>
References: <20190528105623.27983-1-sgarzare@redhat.com>
	<20190528105623.27983-2-sgarzare@redhat.com>
	<20190529.212852.1077585415381753122.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190529.212852.1077585415381753122.davem@davemloft.net>
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

On Wed, May 29, 2019 at 09:28:52PM -0700, David Miller wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> Date: Tue, 28 May 2019 12:56:20 +0200
> 
> > @@ -68,7 +68,13 @@ struct virtio_vsock {
> >  
> >  static struct virtio_vsock *virtio_vsock_get(void)
> >  {
> > -	return the_virtio_vsock;
> > +	struct virtio_vsock *vsock;
> > +
> > +	mutex_lock(&the_virtio_vsock_mutex);
> > +	vsock = the_virtio_vsock;
> > +	mutex_unlock(&the_virtio_vsock_mutex);
> > +
> > +	return vsock;
> 
> This doesn't do anything as far as I can tell.
> 
> No matter what, you will either get the value before it's changed or
> after it's changed.
> 
> Since you should never publish the pointer by assigning it until the
> object is fully initialized, this can never be a problem even without
> the mutex being there.
> 
> Even if you sampled the the_virtio_sock value right before it's being
> set to NULL by the remove function, that still can happen with the
> mutex held too.

Yes, I found out when I was answering Jason's question [1]. :(

I proposed to use RCU to solve this issue, do you agree?
Let me know if there is a better way.

> 
> This function is also terribly named btw, it implies that a reference
> count is being taken.  But that's not what this function does, it
> just returns the pointer value as-is.

What do you think if I remove the function, using directly the_virtio_vsock?
(should be easier to use with RCU API)

Thanks,
Stefano

[1] https://lore.kernel.org/netdev/20190529105832.oz3sagbne5teq3nt@steredhat
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
