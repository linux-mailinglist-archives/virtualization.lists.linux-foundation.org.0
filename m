Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0C93655E4
	for <lists.virtualization@lfdr.de>; Tue, 20 Apr 2021 12:09:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 087BC402E1;
	Tue, 20 Apr 2021 10:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DCXnVyzwJdIm; Tue, 20 Apr 2021 10:09:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0E45402EB;
	Tue, 20 Apr 2021 10:09:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B1EEC000E;
	Tue, 20 Apr 2021 10:09:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FB0DC000B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 10:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EB2983131
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 10:09:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ua995GWyNMVM
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 10:09:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B15DD82F49
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 10:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618913367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a1pYqsNDnaImaveZt19WFrefpysHdoYlJwKJGNtTNq4=;
 b=C0T6fv0kROrqhhqkDlj+3uaztkbQ17x0ueP1He5z6BuBYbGJXpx9uZs3ZRiRlmwl8PoHfE
 MZ2BrkfnqVsaB1zmitaasMaTNXltDvFwliaAXN5j82pPGjgib8JC1bu6muot3aJLc3ZgXX
 5A0oSD24mvmN+ynpyQ8ODXaBx/HQ7vI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-EVzQ6LGxPJS_H1UyDHilug-1; Tue, 20 Apr 2021 06:08:34 -0400
X-MC-Unique: EVzQ6LGxPJS_H1UyDHilug-1
Received: by mail-wm1-f71.google.com with SMTP id
 g144-20020a1c20960000b029012983de0c8fso4353149wmg.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 03:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a1pYqsNDnaImaveZt19WFrefpysHdoYlJwKJGNtTNq4=;
 b=KIsSwsvxs2uxT5ocKV4+UzUn/O927rEF6+S0K5Pw0Hi1M5N/NWgWbJg96dq9l4PMTw
 kseLYJS8K6RYIDUbHW46gbN2hTYvHsouM+UdNs4PQ5n0Sjp8LrsM09PXhFP2YSOlIkAp
 B2b3aJmXRM32AzW1pVbH1TRoSw5gL5bBlZhAFLQ+qOywpWGc9UIuz8B/DmPXDa/Z5Mkm
 szh9Bz0eGu0/ue/BFMXBbhCXkd+65f0ewpxtC8+sT2Kl7yP2Sw4lds/i7JYhSNoTlkib
 hWj8MMsP0HK4F9iOulsR0SUhzTkDJTf6ztU8mnLGD8I6NUXitb5ilu2J7K+n4o1jPe0P
 SZQw==
X-Gm-Message-State: AOAM530BOTBrZbCeo1XMqJnvjpcW/dXU9TcGQ44LWtJU3j7eo7TXc/H6
 xX9XE7cBbd/oDC7DRLqA0S8Phu+2aMahE36T400CyHAwOgZ2QH8z2Ve8wrd7EK5rHXdneiOQt4o
 97mPF3a8F0EqRffZbjj6El9DlIbfBu3Vk/ImSuDtMJQ==
X-Received: by 2002:adf:bbd2:: with SMTP id z18mr19583492wrg.274.1618913313337; 
 Tue, 20 Apr 2021 03:08:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiOVtXxYFOUh6+eZ32xEpHAEZlXERzd+C/fJVENNgoKL6Wlrxpy9j9zC3V92YoEbuatNntfw==
X-Received: by 2002:adf:bbd2:: with SMTP id z18mr19583476wrg.274.1618913313205; 
 Tue, 20 Apr 2021 03:08:33 -0700 (PDT)
Received: from redhat.com ([2a10:800a:cdef:0:114d:2085:61e4:7b41])
 by smtp.gmail.com with ESMTPSA id u8sm26806244wrr.42.2021.04.20.03.08.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 03:08:32 -0700 (PDT)
Date: Tue, 20 Apr 2021 06:08:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2] virtio_blk: Add support for lifetime feature
Message-ID: <20210420060807-mutt-send-email-mst@kernel.org>
References: <20210416194709.155497-1-egranata@google.com>
 <20210420070129.GA3534874@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210420070129.GA3534874@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 stefanha@redhat.com, pbonzini@redhat.com, Enrico Granata <egranata@google.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Apr 20, 2021 at 08:01:29AM +0100, Christoph Hellwig wrote:
> Just to despit my 2 cents again:  I think the way this is specified
> in the virtio spec is actively harmful and we should not suport it in
> Linux.
> 
> If others override me we at least need to require a detailed
> documentation of these fields as the virto spec does not provide it.
> 
> Please also do not add pointless over 80 character lines, and follow
> the one value per sysfs file rule.

Enrico would you like to raise the issues with the virtio TC
for resolution?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
