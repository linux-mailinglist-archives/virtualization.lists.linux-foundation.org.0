Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6239FCD8B1
	for <lists.virtualization@lfdr.de>; Sun,  6 Oct 2019 20:45:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CA384C90;
	Sun,  6 Oct 2019 18:45:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 49055C83
	for <virtualization@lists.linux-foundation.org>;
	Sun,  6 Oct 2019 18:45:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B82BB27B
	for <virtualization@lists.linux-foundation.org>;
	Sun,  6 Oct 2019 18:45:21 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id w14so16102061qto.9
	for <virtualization@lists.linux-foundation.org>;
	Sun, 06 Oct 2019 11:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FDtNMGd4vIkTEBG4VnbaIfDNYKUEZ4dNcxWAbUNY7uo=;
	b=MONqvAWV2NArFHCXriHQxTaQbsAXGUnRmgCUu0KX2YD7MqciBZlmnJpiG7T3dpIScw
	Mn6BbVydeTbNOp/4ICc1FILS5izg1W0wvsNf3f9QaRECvWj/fDOjTK6XhWWKutlZp8fv
	w84reqYic+PpIpn6EC7Y2/DufCRjpztwJYeXsy3baD78Jjs+3DfZu7CbAxeTlbG9SuZf
	hz/v2WFpSBkLGavhfZofgYx3ogLuymC43+RKur87RkrIs7QsxFlgSTdCEeRm2FVjkNOp
	Jn9AQDtAA/5QiE8cLZ1cVAlwuu01nU2cmG02pEPNkbxHPAt/sUvbZhDZ0wISfzHNMojq
	Xt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FDtNMGd4vIkTEBG4VnbaIfDNYKUEZ4dNcxWAbUNY7uo=;
	b=PeJW9If5YovecxLK7TEwBk9t4WCe5+KVADJE8IaLFitoEEIw10L0azUbj+Lizgc4Bg
	3h1vAJUIn1kbZH1ZKvEPn/rUj/ZOf8e7MsawY9pMCNjmN3k9v5Z56XrpDI804JdT3Lt/
	BwPC0ivMk0/0YY0EW5jIb0yRquOQkiSKVmL3rx2rSjDLsJ/TSZypxJiaoxvz/2PPaa+r
	ABIkhQpeyIFkOdMj5ybciVKIMLleuKj/PN4mOTRGNMJZOJ7aNGTee18WEAqEvHxv8bwj
	yadbIrDXr8k+mAdob5npjiDJEvPZ1sRjAZXNuwFNDhtDZbkAVDJP+YXUtEm4YZbdthSf
	px5w==
X-Gm-Message-State: APjAAAWYyemfpPGRUV+3/k29MCBoLsrITEKLAOQ9s9IY6RHzOwGiGDLZ
	E2TvpAvA4VEhugpDIU8tBwE=
X-Google-Smtp-Source: APXvYqzTgC0tNHX/1kg7nS97bMQhXuCqAxgVHWRofRl0lCE9xwQis8uTGV52SavGw0YEnwQZvl4PPQ==
X-Received: by 2002:ac8:5243:: with SMTP id y3mr26218021qtn.51.1570387520605; 
	Sun, 06 Oct 2019 11:45:20 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7cb:21c2:d505:73c7:4df5:8eac])
	by smtp.gmail.com with ESMTPSA id
	l23sm11275578qta.53.2019.10.06.11.45.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 06 Oct 2019 11:45:19 -0700 (PDT)
From: jcfaracco@gmail.com
To: netdev@vger.kernel.org
Subject: [PATCH RFC net-next 0/2] drivers: net: virtio_net: Implement 
Date: Sun,  6 Oct 2019 15:45:13 -0300
Message-Id: <20191006184515.23048-1-jcfaracco@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: dnmendes76@gmail.com, mst@redhat.com, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, davem@davemloft.net
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

From: Julio Faracco <jcfaracco@gmail.com>

Driver virtio_net is not handling error events for TX provided by 
dev_watchdog. This event is reached when transmission queue is having 
problems to transmit packets. To enable it, driver should have 
.ndo_tx_timeout implemented. This serie has two commits:

In the past, we implemented a function to recover driver state when this
kind of event happens, but the structure was to complex for virtio_net
that moment. Alternativelly, this skeleton should be enough for now.

For further details, see thread:
https://lkml.org/lkml/2015/6/23/691

Patch 1/2:
  Add statistic field for TX timeout events.

Patch 2/2:
  Implement a skeleton function to debug TX timeout events.

Julio Faracco (2):
  drivers: net: virtio_net: Add tx_timeout stats field
  drivers: net: virtio_net: Add tx_timeout function

 drivers/net/virtio_net.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
