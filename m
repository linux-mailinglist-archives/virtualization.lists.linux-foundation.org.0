Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F85FD81EC
	for <lists.virtualization@lfdr.de>; Tue, 15 Oct 2019 23:19:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A9BBCC96;
	Tue, 15 Oct 2019 21:19:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6D2DBC96
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 21:19:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2403C5D3
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 21:19:16 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
	[209.85.222.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A1DD92A09DC
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 21:19:14 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id x77so21482382qka.11
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 14:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=dL6rRUzanF/mngAS+r+PSLw0RQ+CPB/xDAExf30z58I=;
	b=B920w8qZBMxlC2UcHlcl1vEUTyXqg7sAo5AKngnacjgour6GEWpMe8k8m6YCB1B58H
	1RH+oqshFOEokCpG3kl+bCcLHMuq+rEx7GDqZyhzYdz3y8OFlFipEdIBIiGbDpwFICZQ
	V+RQM2MHQWruRV47P0Ju6iO4ml1xrU9q+QrB79yBx4SBwGNenwwjlDPC/lGmm/PU4miu
	58uqBGHDvDxyCzem2pw5ybiSVx4pJ7M/FJWbrONeiuMcUP2vbVjPtKF+4zq93lRKzzHU
	/7+EryqjgORl7uH7aUH2u6N9akaeXjbZkOsl42aMkcIWiR0h3TvvrWdQqDouYoRG7E21
	IeZA==
X-Gm-Message-State: APjAAAUsu5TfF6LVw50CkFZVsdcAgz/QDlda5PCTUf4xO7ZUzkotOeXd
	s59Ke5NcEMNgt77wLh6kBTItQQv0AeN9TgtddRkWIQ5Ow5LHlnFuZzNVev3vj/b5mraYDGm5k5C
	KF+WFZtqDcarhuV2JVKWPolRkbpjP2eA7Jta1C13P6w==
X-Received: by 2002:a0c:f612:: with SMTP id r18mr38402296qvm.56.1571174353649; 
	Tue, 15 Oct 2019 14:19:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzMCqTGbwZd7p8eXtvsCO6t1D+F0697yJqDJ1oBBJZwAb7HGPZvXklyA5piJoGL8p8xGUaolQ==
X-Received: by 2002:a0c:f612:: with SMTP id r18mr38402264qvm.56.1571174353431; 
	Tue, 15 Oct 2019 14:19:13 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	q44sm14292649qtk.16.2019.10.15.14.19.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 15 Oct 2019 14:19:12 -0700 (PDT)
Date: Tue, 15 Oct 2019 17:19:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PULL] vhost: cleanups and fixes
Message-ID: <20191015171908-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, jan.kiszka@web.de
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

The following changes since commit da0c9ea146cbe92b832f1b0f694840ea8eb33cce:

  Linux 5.4-rc2 (2019-10-06 14:27:30 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git tags/for_linus

for you to fetch changes up to 245cdd9fbd396483d501db83047116e2530f245f:

  vhost/test: stop device before reset (2019-10-13 09:38:27 -0400)

----------------------------------------------------------------
virtio: fixes

Some minor bugfixes

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

----------------------------------------------------------------
Michael S. Tsirkin (3):
      tools/virtio: more stubs
      tools/virtio: xen stub
      vhost/test: stop device before reset

 drivers/vhost/test.c             | 2 ++
 tools/virtio/crypto/hash.h       | 0
 tools/virtio/linux/dma-mapping.h | 2 ++
 tools/virtio/xen/xen.h           | 6 ++++++
 4 files changed, 10 insertions(+)
 create mode 100644 tools/virtio/crypto/hash.h
 create mode 100644 tools/virtio/xen/xen.h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
