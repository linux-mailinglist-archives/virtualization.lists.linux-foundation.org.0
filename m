Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A87F032E2E
	for <lists.virtualization@lfdr.de>; Mon,  3 Jun 2019 13:07:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E5C8ECDD;
	Mon,  3 Jun 2019 11:07:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B57337A4
	for <virtualization@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 11:07:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3BEF65D3
	for <virtualization@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 11:07:22 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b18so11538278wrq.12
	for <virtualization@lists.linux-foundation.org>;
	Mon, 03 Jun 2019 04:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Rdf+QSazMX9W42t15vMnXFExNCmmHTg2hetZgBVUhIY=;
	b=O2MYlDrNxNKobQ6wjPiCRnSwrs4yI26Od1jXQjpczWmDB7wpvZCFa4SYsz/sQa6UO+
	ai+MonuKK58t7c+TqpU7i66Y+yrMri29DhJ1uqxug7QT/2+hB5rP0hZiB/mhf1FtOatH
	oQsszjx6QABhLkebe+9a2iPr6SGc6Hr35/lq6t0M3XSASu3DcA2ty8A07vu2TPEsUnKv
	leaVaJ6VHSsgAU8IBRQIs+NBm/4vxrHrs1wrL4jJjgw2sS9iF3lyvEkRAt1fp4gDGejg
	u8uLSX7JzCHciodA2xvnHBQyDlaxdOF0YEVF/CIlnMPndtwfVgKwbxlnaJEiwN/MaNTK
	hjDA==
X-Gm-Message-State: APjAAAWMWsADFEgx8WDaCu+aOpcZG73+wbxK3VQbs/G3hEqV7u7pJqD0
	iyIXtk/ZogD08gI862HgFMn5zw==
X-Google-Smtp-Source: APXvYqzxDfQTTupgrN70BEqNhLgAiEj+6mlq4Bfy4o1lRFeVEHVZDlJsyp3DX8S5zo8Bj0v34tqjEQ==
X-Received: by 2002:adf:aa0a:: with SMTP id p10mr15815063wrd.125.1559560040922;
	Mon, 03 Jun 2019 04:07:20 -0700 (PDT)
Received: from steredhat.homenet.telecomitalia.it
	(host253-229-dynamic.248-95-r.retail.telecomitalia.it.
	[95.248.229.253]) by smtp.gmail.com with ESMTPSA id
	w14sm1632043wrk.44.2019.06.03.04.07.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 03 Jun 2019 04:07:20 -0700 (PDT)
Date: Mon, 3 Jun 2019 13:07:17 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v3 2/5] vsock/virtio: fix locking for fwd_cnt and buf_alloc
Message-ID: <20190603110717.rjbwfojpdpye3yxe@steredhat.homenet.telecomitalia.it>
References: <20190531133954.122567-1-sgarzare@redhat.com>
	<20190531133954.122567-3-sgarzare@redhat.com>
	<20190602.180334.1932703293092139564.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190602.180334.1932703293092139564.davem@davemloft.net>
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

On Sun, Jun 02, 2019 at 06:03:34PM -0700, David Miller wrote:
> From: Stefano Garzarella <sgarzare@redhat.com>
> Date: Fri, 31 May 2019 15:39:51 +0200
> 
> > @@ -434,7 +434,9 @@ void virtio_transport_set_buffer_size(struct vsock_sock *vsk, u64 val)
> >  	if (val > vvs->buf_size_max)
> >  		vvs->buf_size_max = val;
> >  	vvs->buf_size = val;
> > +	spin_lock_bh(&vvs->rx_lock);
> >  	vvs->buf_alloc = val;
> > +	spin_unlock_bh(&vvs->rx_lock);
> 
> This locking doesn't do anything other than to strongly order the
> buf_size store to occur before the buf_alloc one.

Sure, I'll remove the lock. I was confused because I moved its reading
under the rx_lock (together with other variables), but here I'm updating
only buf_alloc, so this lock is useless.

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
