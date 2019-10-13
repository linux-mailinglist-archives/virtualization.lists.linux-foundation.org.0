Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C79D560F
	for <lists.virtualization@lfdr.de>; Sun, 13 Oct 2019 13:54:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2367E237F;
	Sun, 13 Oct 2019 11:54:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CBAA92367
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 11:42:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6A01A5D3
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 11:42:04 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
	[209.85.222.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A13218553B
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 11:42:03 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id k67so14119871qkc.3
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 04:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=WhM42HnkXorw8ZktlIqV/yS0IRHKb5HISbW//fiFIIA=;
	b=iiWdeEWmqwAz1i8v3V8Ll72fKYlaLRNo7//0ViBg4yywysre9aVO+AVVcKiW/qjtd6
	bG9PFFmiHq1/f9lQgsYj/uGBCbn40N5w0wuEJXiiGuiljRZR9Til2+nV7K+YoUeiq3Qj
	DQ6CDvalkBn0XJghGWLUNTAVZ4urDDjPLL0bxYtejwcwBjjuQh/xpNMsMQHWgraW8zdB
	obW8N4UtwuvnzKSSCNkn2Ogwm2Tkwp07Z57RLyiyOWkRBFbblFjcNskl7eeCSbjLKui3
	Lxa1miG364bfO9OD8BXXdXn93335EJ6HvcCKyIray/utztHoVqftBmmCSTnHX6+W53mx
	y0Sg==
X-Gm-Message-State: APjAAAUNX9L03kkJga3a1oPf08dYKS9kmhDR6cCJ5bMunF8fJQ4Srwou
	S9ps05aBv0so5BlIUi3qXnmNLR4MoD89TiWgaOZv+TWQywt/t1GGCbO4pQTX2mdcL6rxpTMcwQU
	bsJjoDOysoms7SSMvFhDtLMkVeMJqbCJPfrQDcl3now==
X-Received: by 2002:a37:a14d:: with SMTP id k74mr25294017qke.308.1570966922926;
	Sun, 13 Oct 2019 04:42:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxJbPZHmjjRtZPdn0OIP4+7Md8xReA9OfG4qhSoToCuN8Mn6p7CW5fNAnas5HTHE7lcLL2Caw==
X-Received: by 2002:a37:a14d:: with SMTP id k74mr25293998qke.308.1570966922588;
	Sun, 13 Oct 2019 04:42:02 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	d25sm1763837qtj.84.2019.10.13.04.41.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 13 Oct 2019 04:42:01 -0700 (PDT)
Date: Sun, 13 Oct 2019 07:41:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH RFC v4 0/5] vhost: ring format independence
Message-ID: <20191013113940.2863-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, kvm@vger.kernel.org,
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

This adds infrastructure required for supporting
multiple ring formats.

The idea is as follows: we convert descriptors to an
independent format first, and process that converting to
iov later.

The point is that we have a tight loop that fetches
descriptors, which is good for cache utilization.
This will also allow all kind of batching tricks -
e.g. it seems possible to keep SMAP disabled while
we are fetching multiple descriptors.

This seems to perform exactly the same as the original
code already based on a microbenchmark.
Lightly tested.
More testing would be very much appreciated.

To use new code:
	echo 1 > /sys/module/vhost_test/parameters/newcode
or
	echo 1 > /sys/module/vhost_net/parameters/newcode

changes from v3:
        - fixed error handling in case of indirect descriptors
        - add BUG_ON to detect buffer overflow in case of bugs
                in response to comment by Jason Wang
        - minor code tweaks

Changes from v2:
	- fixed indirect descriptor batching
                reported by Jason Wang

Changes from v1:
	- typo fixes


Michael S. Tsirkin (5):
  vhost: option to fetch descriptors through an independent struct
  vhost/test: add an option to test new code
  vhost: batching fetches
  vhost/net: add an option to test new code
  vhost: last descriptor must have NEXT clear

 drivers/vhost/net.c   |  32 ++++-
 drivers/vhost/test.c  |  19 ++-
 drivers/vhost/vhost.c | 328 +++++++++++++++++++++++++++++++++++++++++-
 drivers/vhost/vhost.h |  20 ++-
 4 files changed, 385 insertions(+), 14 deletions(-)

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
