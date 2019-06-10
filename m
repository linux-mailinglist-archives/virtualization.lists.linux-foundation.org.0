Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A1B3BE35
	for <lists.virtualization@lfdr.de>; Mon, 10 Jun 2019 23:18:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DAC84E6C;
	Mon, 10 Jun 2019 21:18:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 081618DC
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 21:18:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B1D31174
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 21:18:17 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id s11so5988525pfm.12
	for <virtualization@lists.linux-foundation.org>;
	Mon, 10 Jun 2019 14:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=m0QdMbKNLVs0T8bKlIwsAC6CTJBWav9NlL0ckO7DwlA=;
	b=aXsWgQ9MISu7GVEUvnuqIx+fsqGjVQgLb+MZC1mkE1EKEL+Yw+ZR7o/wgZr5NWOk4A
	rFulQA7GH29PRBa/ecTRG3Ylp+faYI3nHqeOr5anX/cH/RqXZ+YLWjGA9z9XBIcv2mjy
	W2vI8mfwM7dgPo9C1Xs9WYcMsCWOWMGOU8GJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=m0QdMbKNLVs0T8bKlIwsAC6CTJBWav9NlL0ckO7DwlA=;
	b=Pk/sh8ZS7dBALNSfW2VhUlmrvRyCNowv7VnPbg8/GGFpWr7DXCPKgomsWG0GvDvAYL
	XPAsIxrtq2H4q/js+FoNUKcPepdiFF3eBf6FjzZCOhkQmZhiGcJUDBaSxDxn/1/WFYy5
	J+K5jPBY1+6KmL1blaZnwfO2h1dWSmGZSCSJNUcT9cX89pKLLBvZB+oRl+RM4oNuAS+m
	tTgwEKKQ65f6BOdc9Kpfhlj7lzETRfcNCq1evh8PdHxaF18KGrpyUWSl5GbkCk2XOl0r
	3hZC2IJt101qW7q1VPATIo8LhH01Lunv8/LQElS8PqJOwC+ROLqiQxzKUILi48HeE7pe
	xt6A==
X-Gm-Message-State: APjAAAVcdwmaez0xLCoknp4JrslLKZxiDiOChZcd+15vId+Kf64dqOW7
	Th+dNH2AcgFMQ/Go+c8i4ZxdSw==
X-Google-Smtp-Source: APXvYqwnWc4Rkv1HzFVoZjhnGWJK4oUgbCaO10e5+E+NJPsLfANZDbIWyiAzXN7RiRLG8EjciU0zmg==
X-Received: by 2002:a62:5c84:: with SMTP id
	q126mr50065148pfb.247.1560201497375; 
	Mon, 10 Jun 2019 14:18:17 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
	by smtp.gmail.com with ESMTPSA id p43sm427645pjp.4.2019.06.10.14.18.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jun 2019 14:18:16 -0700 (PDT)
From: davidriley@chromium.org
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH v2 0/4] drm/virtio: Ensure cached capset entries are valid
	before copying.
Date: Mon, 10 Jun 2019 14:18:06 -0700
Message-Id: <20190610211810.253227-1-davidriley@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190605234423.11348-1-davidriley@chromium.org>
References: <20190605234423.11348-1-davidriley@chromium.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	Daniel Vetter <daniel@ffwll.ch>
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

From: David Riley <davidriley@chromium.org>


v2: Updated barriers.

David Riley (4):
  drm/virtio: Ensure cached capset entries are valid before copying.
  drm/virtio: Wake up all waiters when capset response comes in.
  drm/virtio: Fix cache entry creation race.
  drm/virtio: Add memory barriers for capset cache.

 drivers/gpu/drm/virtio/virtgpu_ioctl.c |  6 ++++--
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 26 ++++++++++++++++++++++++--
 2 files changed, 28 insertions(+), 4 deletions(-)

-- 
2.22.0.rc2.383.gf4fbbf30c2-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
