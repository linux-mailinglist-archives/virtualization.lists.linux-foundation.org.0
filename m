Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 139A62802D
	for <lists.virtualization@lfdr.de>; Thu, 23 May 2019 16:48:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2847AEE5;
	Thu, 23 May 2019 14:48:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 973B7EB7
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 14:48:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 286BA7FB
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 14:48:22 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d9so6632299wrx.0
	for <virtualization@lists.linux-foundation.org>;
	Thu, 23 May 2019 07:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2ckXbhMxVptMY6LVeqIsAfsudm6ALnBUEQ58+S9KXj0=;
	b=fyB5smpXxQ9KIxobbDS0TRfpJeXoeZWx06EKZqy1KuSTst6qLOanF1sHYWgCHFAFIq
	xIMk6rHIda9kxLH1MgsK5762Ye7n7Q4p/wLlelf46E5M5B4Zk7PqdyYy9Ku/yeo8Cxbl
	vqeU6msoM9GJ7T8xYGsRZLDHXoMoqUeykdQjoD0RMe7wjL5meZsEO4k3hu+daQiQYj66
	5nKa8c0XwZorE1pCZ+42S6lZo6W1FDtfkd3hTKDos6yww7SF8fhlHC/nWbvbqRP9wsQb
	jL7cw1WAoQYnE+ZBQnWDTmf5uEC63a8WRie1e614QCWAiXnHv/4eUeRmogmddPiotw9o
	Kedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2ckXbhMxVptMY6LVeqIsAfsudm6ALnBUEQ58+S9KXj0=;
	b=enUdLCZz3s0gMxJGXj3ECCTwIN74gq0xTuy/ls3Y2X3IqJ6HC4BnXgXmHo2YpTH0g5
	0KQtcXJVx2Uh+FXc7lFz7leNtg7y3shrHVsjhLqSKpSk20vClTCRZdqKy+PbYUtDWtd9
	3VHfFR8SjwBeM0AO/9I9yV229E1JF9ikRGsxjG71/29s9rOJfLHKV37DEXhA3pbIdGeN
	tTiTBf+sfVdAfp1dRexigtmkkmEoFa4PhrOUUzSb/chJMIi89SbkK6x5ykmY9PAGzMkg
	plvq+W4XpiDiKw3fEuVBZk90f62c3EqeFaE5qB8LTbBo/ySAph04Zew71AxckhbA9R1E
	2/RA==
X-Gm-Message-State: APjAAAUqyfRDQ8SBaN6JOtIsXEjji3fVW5AUUxWTQr37ks7ol6MaDLFM
	6sIDSvtvCvoCns33VlNazSDNPd1Nd/V8F777KLc=
X-Google-Smtp-Source: APXvYqzJaa74jk0r/RYkks9NQS+a3OOWeFm+UyuWzIklKLTRV3IuVue8Qa5l6wrV/GBiRXApv/glEAm4BNsMi7Js+CU=
X-Received: by 2002:adf:f6cb:: with SMTP id y11mr1385664wrp.67.1558622900872; 
	Thu, 23 May 2019 07:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190423102512.72265-1-benbjiang@tencent.com>
In-Reply-To: <20190423102512.72265-1-benbjiang@tencent.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 23 May 2019 15:48:07 +0100
Message-ID: <CAJSP0QXwRESqPjV6HJEffY-t8z7LC5ZZQeKsqinap4yWy_T3dg@mail.gmail.com>
Subject: Re: [PATCH] virtio/virtio_ring: do some comment fixes
To: Jiang Biao <benbjiang@tencent.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux Virtualization <virtualization@lists.linux-foundation.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
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

On Sun, May 19, 2019 at 5:17 PM Jiang Biao <benbjiang@tencent.com> wrote:
>
> There are lots of mismatches between comments and codes, this
> patch do these comment fixes.
>
> Signed-off-by: Jiang Biao <benbjiang@tencent.com>
> ---
>  drivers/virtio/virtio_ring.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
