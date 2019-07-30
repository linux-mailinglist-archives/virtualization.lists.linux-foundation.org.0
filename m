Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0D57A4F6
	for <lists.virtualization@lfdr.de>; Tue, 30 Jul 2019 11:45:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 34BD62608;
	Tue, 30 Jul 2019 09:45:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5B8FF25F5
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 09:40:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 07D98D3
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 09:40:17 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c2so61788342wrm.8
	for <virtualization@lists.linux-foundation.org>;
	Tue, 30 Jul 2019 02:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fQg1192WhNDyv6FjBGie6urrqGv9zjrLIH2bCUp56uc=;
	b=OzaTyYLwlDAzU0QQgLVY7Jwuz4FoB7tNA8XQmUMXUEG69ERIqbLMLgBQ2rXLzsXwbX
	DqaAJ5Lmxu1nfiRhkYKxLsSeBtQm2uUoHF+I9nIeN9oQRaOZGEUZBOxhAlTtzg4AVOpG
	3T9BnpTQ6HmRJix4SV4izP88+Wp05XEDPwLN/HUW2HT/3iMMxR5zdSImhTeTRpVQVQoV
	53SMli8ZPyGp+85Dx+lHwGgC3NFNDINw0DX+o/zdUY1wxVu2OI1uRms3oXLIKSkLpD9t
	xUp2wv66uVnjiFmuoVl6wlnqQXmjkVG7dBtt78zu8/JfOKwU3AkO7aoNF0T6/Stsa021
	IcLg==
X-Gm-Message-State: APjAAAVSwcH3P8uiH1WFZZsM/R9Iv+GlgGhWBjUdM3jT/qS4kL3Fc0N3
	zbbmCtOKV1WwOwo+57mgzFglkRArVKU=
X-Google-Smtp-Source: APXvYqwQrJXSgJVI83eo1dkA3KRV/8pRzTuIDgoLCeF0kh3lvGAFxSVFdhlDZkRo9pud0n2msXMp9A==
X-Received: by 2002:a5d:50d1:: with SMTP id f17mr72705216wrt.124.1564479615723;
	Tue, 30 Jul 2019 02:40:15 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
	[79.13.201.122]) by smtp.gmail.com with ESMTPSA id
	r12sm77203676wrt.95.2019.07.30.02.40.14
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 30 Jul 2019 02:40:15 -0700 (PDT)
Date: Tue, 30 Jul 2019 11:40:13 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v4 0/5] vsock/virtio: optimizations to increase the
	throughput
Message-ID: <20190730094013.ruqjllqrjmkdnh5y@steredhat>
References: <20190717113030.163499-1-sgarzare@redhat.com>
	<20190729095743-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729095743-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

On Mon, Jul 29, 2019 at 09:59:23AM -0400, Michael S. Tsirkin wrote:
> On Wed, Jul 17, 2019 at 01:30:25PM +0200, Stefano Garzarella wrote:
> > This series tries to increase the throughput of virtio-vsock with slight
> > changes.
> > While I was testing the v2 of this series I discovered an huge use of memory,
> > so I added patch 1 to mitigate this issue. I put it in this series in order
> > to better track the performance trends.
> 
> Series:
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> 
> Can this go into net-next?
> 

I think so.
Michael, Stefan thanks to ack the series!

Should I resend it with net-next tag?

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
