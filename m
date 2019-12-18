Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A09D312501C
	for <lists.virtualization@lfdr.de>; Wed, 18 Dec 2019 19:07:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4F56A86BBC;
	Wed, 18 Dec 2019 18:07:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVooetUTabOa; Wed, 18 Dec 2019 18:07:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6E0E886BA3;
	Wed, 18 Dec 2019 18:07:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53553C077D;
	Wed, 18 Dec 2019 18:07:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DA97C077D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 568A62014B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7x6lm8zDv7l5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 1CF412050F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 18:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576692444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nmdGUwTvoHp9zBzsfUh31MNBzW9ZhcHvi1/dZfx3TSc=;
 b=UaOg8v0QtzadQldEogCOhNqNeoUxnrLvQxx631DrXamp5YXFFsNw5fjx73DiEZd3r2BUdG
 p2wS29Q20kx6psKB8ykqxNliGkqcL5xEsjkh3Y+YlL36kWSmTWfsjrBbJv9v+ur/F1aBAg
 bk9kgoDsS/jotUbvPjLxpzhGJNfPpAU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-bjYQnByeNymkKKOVYrH73A-1; Wed, 18 Dec 2019 13:07:17 -0500
X-MC-Unique: bjYQnByeNymkKKOVYrH73A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1626E1088381;
 Wed, 18 Dec 2019 18:07:16 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-218.ams2.redhat.com
 [10.36.117.218])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1592E5D9E2;
 Wed, 18 Dec 2019 18:07:08 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: davem@davemloft.net
Subject: [PATCH net-next v3 00/11] VSOCK: add vsock_test test suite
Date: Wed, 18 Dec 2019 19:06:57 +0100
Message-Id: <20191218180708.120337-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jorgen Hansen <jhansen@vmware.com>
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

The vsock_diag.ko module already has a test suite but the core AF_VSOCK
functionality has no tests. This patch series adds several test cases that
exercise AF_VSOCK SOCK_STREAM socket semantics (send/recv, connect/accept,
half-closed connections, simultaneous connections).

The v1 of this series was originally sent by Stefan.

v3:
- Patch 6:
  * check the byte received in the recv_byte()
  * use send(2)/recv(2) instead of write(2)/read(2) to test also flags
    (e.g. MSG_PEEK)
- Patch 8:
  * removed unnecessary control_expectln("CLOSED") [Stefan].
- removed patches 9,10,11 added in the v2
- new Patch 9 add parameters to list and skip tests (e.g. useful for vmci
  that doesn't support half-closed socket in the host)
- new Patch 10 prints a list of options in the help
- new Patch 11 tests MSG_PEEK flags of recv(2)

v2: https://patchwork.ozlabs.org/cover/1140538/
v1: https://patchwork.ozlabs.org/cover/847998/

Stefan Hajnoczi (7):
  VSOCK: fix header include in vsock_diag_test
  VSOCK: add SPDX identifiers to vsock tests
  VSOCK: extract utility functions from vsock_diag_test.c
  VSOCK: extract connect/accept functions from vsock_diag_test.c
  VSOCK: add full barrier between test cases
  VSOCK: add send_byte()/recv_byte() test utilities
  VSOCK: add AF_VSOCK test cases

Stefano Garzarella (4):
  vsock_test: wait for the remote to close the connection
  testing/vsock: add parameters to list and skip tests
  testing/vsock: print list of options and description
  vsock_test: add SOCK_STREAM MSG_PEEK test

 tools/testing/vsock/.gitignore        |   1 +
 tools/testing/vsock/Makefile          |   9 +-
 tools/testing/vsock/README            |   3 +-
 tools/testing/vsock/control.c         |  15 +-
 tools/testing/vsock/control.h         |   2 +
 tools/testing/vsock/timeout.h         |   1 +
 tools/testing/vsock/util.c            | 376 +++++++++++++++++++++++++
 tools/testing/vsock/util.h            |  49 ++++
 tools/testing/vsock/vsock_diag_test.c | 202 ++++----------
 tools/testing/vsock/vsock_test.c      | 379 ++++++++++++++++++++++++++
 10 files changed, 883 insertions(+), 154 deletions(-)
 create mode 100644 tools/testing/vsock/util.c
 create mode 100644 tools/testing/vsock/util.h
 create mode 100644 tools/testing/vsock/vsock_test.c

-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
