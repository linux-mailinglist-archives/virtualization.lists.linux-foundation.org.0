Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 904291FB720
	for <lists.virtualization@lfdr.de>; Tue, 16 Jun 2020 17:44:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 40ED2895A0;
	Tue, 16 Jun 2020 15:44:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mwTKNmb+Kw-a; Tue, 16 Jun 2020 15:44:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3FC1589573;
	Tue, 16 Jun 2020 15:44:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E0F7C016E;
	Tue, 16 Jun 2020 15:44:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB6FFC016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 15:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C903E26351
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 15:43:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Uou+MFQqK2l
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 15:43:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 2433C2637C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 15:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592322235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=n2vgEtySMMJw+Y6/Iz7yVj4GHK2o/g3YD4HMOMKMGxw=;
 b=Kr0cwc+HRVHnmnKsYYV3UqzW3PHTGjd/Qb4fvvXrY9gxrA+fC4zPWzeE+63uGE7zkOtHoK
 GfgiIfEKFyYdyuToX7/lqNCnV935c+cFQyZ7ZlZ2ZbVwnemwqwS/BOZQ2ttPGADs80G1Lz
 Xl+sF7Gm/o42WUYge8t/5umo2Zca46c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-iVwDnxGCNeS1_dm-BMJ-EQ-1; Tue, 16 Jun 2020 11:43:51 -0400
X-MC-Unique: iVwDnxGCNeS1_dm-BMJ-EQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A261EC1A2;
 Tue, 16 Jun 2020 15:43:45 +0000 (UTC)
Received: from llong.com (ovpn-114-156.rdu2.redhat.com [10.10.114.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68C6460C47;
 Tue, 16 Jun 2020 15:43:37 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Joe Perches <joe@perches.com>, Matthew Wilcox <willy@infradead.org>,
 David Rientjes <rientjes@google.com>
Subject: [PATCH v5 0/2] mm, treewide: Rename kzfree() to kfree_sensitive()
Date: Tue, 16 Jun 2020 11:43:09 -0400
Message-Id: <20200616154311.12314-1-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-wpan@vger.kernel.org,
 Waiman Long <longman@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 linux-pm@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com,
 linux-ppp@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

 v5:
  - Break the btrfs patch out as a separate patch to be processed
    independently.
  - Update the commit log of patch 1 to make it less scary.
  - Add a kzfree backward compatibility macro in patch 2.

 v4:
  - Break out the memzero_explicit() change as suggested by Dan Carpenter
    so that it can be backported to stable.
  - Drop the "crypto: Remove unnecessary memzero_explicit()" patch for
    now as there can be a bit more discussion on what is best. It will be
    introduced as a separate patch later on after this one is merged.

This patchset makes a global rename of the kzfree() to kfree_sensitive()
to highlight the fact buffer clearing is only needed if the data objects
contain sensitive information like encrpytion key. The fact that kzfree()
uses memset() to do the clearing isn't totally safe either as compiler
may compile out the clearing in their optimizer especially if LTO is
used. Instead, the new kfree_sensitive() uses memzero_explicit() which
won't get compiled out.


Waiman Long (2):
  mm/slab: Use memzero_explicit() in kzfree()
  mm, treewide: Rename kzfree() to kfree_sensitive()

 arch/s390/crypto/prng.c                       |  4 +--
 arch/x86/power/hibernate.c                    |  2 +-
 crypto/adiantum.c                             |  2 +-
 crypto/ahash.c                                |  4 +--
 crypto/api.c                                  |  2 +-
 crypto/asymmetric_keys/verify_pefile.c        |  4 +--
 crypto/deflate.c                              |  2 +-
 crypto/drbg.c                                 | 10 +++---
 crypto/ecc.c                                  |  8 ++---
 crypto/ecdh.c                                 |  2 +-
 crypto/gcm.c                                  |  2 +-
 crypto/gf128mul.c                             |  4 +--
 crypto/jitterentropy-kcapi.c                  |  2 +-
 crypto/rng.c                                  |  2 +-
 crypto/rsa-pkcs1pad.c                         |  6 ++--
 crypto/seqiv.c                                |  2 +-
 crypto/shash.c                                |  2 +-
 crypto/skcipher.c                             |  2 +-
 crypto/testmgr.c                              |  6 ++--
 crypto/zstd.c                                 |  2 +-
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      |  2 +-
 .../allwinner/sun8i-ss/sun8i-ss-cipher.c      |  2 +-
 drivers/crypto/amlogic/amlogic-gxl-cipher.c   |  4 +--
 drivers/crypto/atmel-ecc.c                    |  2 +-
 drivers/crypto/caam/caampkc.c                 | 28 +++++++--------
 drivers/crypto/cavium/cpt/cptvf_main.c        |  6 ++--
 drivers/crypto/cavium/cpt/cptvf_reqmanager.c  | 12 +++----
 drivers/crypto/cavium/nitrox/nitrox_lib.c     |  4 +--
 drivers/crypto/cavium/zip/zip_crypto.c        |  6 ++--
 drivers/crypto/ccp/ccp-crypto-rsa.c           |  6 ++--
 drivers/crypto/ccree/cc_aead.c                |  4 +--
 drivers/crypto/ccree/cc_buffer_mgr.c          |  4 +--
 drivers/crypto/ccree/cc_cipher.c              |  6 ++--
 drivers/crypto/ccree/cc_hash.c                |  8 ++---
 drivers/crypto/ccree/cc_request_mgr.c         |  2 +-
 drivers/crypto/marvell/cesa/hash.c            |  2 +-
 .../crypto/marvell/octeontx/otx_cptvf_main.c  |  6 ++--
 .../marvell/octeontx/otx_cptvf_reqmgr.h       |  2 +-
 drivers/crypto/mediatek/mtk-aes.c             |  2 +-
 drivers/crypto/nx/nx.c                        |  4 +--
 drivers/crypto/virtio/virtio_crypto_algs.c    | 12 +++----
 drivers/crypto/virtio/virtio_crypto_core.c    |  2 +-
 drivers/md/dm-crypt.c                         | 32 ++++++++---------
 drivers/md/dm-integrity.c                     |  6 ++--
 drivers/misc/ibmvmc.c                         |  6 ++--
 .../hisilicon/hns3/hns3pf/hclge_mbx.c         |  2 +-
 .../net/ethernet/intel/ixgbe/ixgbe_ipsec.c    |  6 ++--
 drivers/net/ppp/ppp_mppe.c                    |  6 ++--
 drivers/net/wireguard/noise.c                 |  4 +--
 drivers/net/wireguard/peer.c                  |  2 +-
 drivers/net/wireless/intel/iwlwifi/pcie/rx.c  |  2 +-
 .../net/wireless/intel/iwlwifi/pcie/tx-gen2.c |  6 ++--
 drivers/net/wireless/intel/iwlwifi/pcie/tx.c  |  6 ++--
 drivers/net/wireless/intersil/orinoco/wext.c  |  4 +--
 drivers/s390/crypto/ap_bus.h                  |  4 +--
 drivers/staging/ks7010/ks_hostif.c            |  2 +-
 drivers/staging/rtl8723bs/core/rtw_security.c |  2 +-
 drivers/staging/wlan-ng/p80211netdev.c        |  2 +-
 drivers/target/iscsi/iscsi_target_auth.c      |  2 +-
 fs/cifs/cifsencrypt.c                         |  2 +-
 fs/cifs/connect.c                             | 10 +++---
 fs/cifs/dfs_cache.c                           |  2 +-
 fs/cifs/misc.c                                |  8 ++---
 fs/crypto/keyring.c                           |  6 ++--
 fs/crypto/keysetup_v1.c                       |  4 +--
 fs/ecryptfs/keystore.c                        |  4 +--
 fs/ecryptfs/messaging.c                       |  2 +-
 include/crypto/aead.h                         |  2 +-
 include/crypto/akcipher.h                     |  2 +-
 include/crypto/gf128mul.h                     |  2 +-
 include/crypto/hash.h                         |  2 +-
 include/crypto/internal/acompress.h           |  2 +-
 include/crypto/kpp.h                          |  2 +-
 include/crypto/skcipher.h                     |  2 +-
 include/linux/slab.h                          |  4 ++-
 lib/mpi/mpiutil.c                             |  6 ++--
 lib/test_kasan.c                              |  6 ++--
 mm/slab_common.c                              | 10 +++---
 net/atm/mpoa_caches.c                         |  4 +--
 net/bluetooth/ecdh_helper.c                   |  6 ++--
 net/bluetooth/smp.c                           | 24 ++++++-------
 net/core/sock.c                               |  2 +-
 net/ipv4/tcp_fastopen.c                       |  2 +-
 net/mac80211/aead_api.c                       |  4 +--
 net/mac80211/aes_gmac.c                       |  2 +-
 net/mac80211/key.c                            |  2 +-
 net/mac802154/llsec.c                         | 20 +++++------
 net/sctp/auth.c                               |  2 +-
 net/sctp/socket.c                             |  2 +-
 net/sunrpc/auth_gss/gss_krb5_crypto.c         |  4 +--
 net/sunrpc/auth_gss/gss_krb5_keys.c           |  6 ++--
 net/sunrpc/auth_gss/gss_krb5_mech.c           |  2 +-
 net/tipc/crypto.c                             | 10 +++---
 net/wireless/core.c                           |  2 +-
 net/wireless/ibss.c                           |  4 +--
 net/wireless/lib80211_crypt_tkip.c            |  2 +-
 net/wireless/lib80211_crypt_wep.c             |  2 +-
 net/wireless/nl80211.c                        | 24 ++++++-------
 net/wireless/sme.c                            |  6 ++--
 net/wireless/util.c                           |  2 +-
 net/wireless/wext-sme.c                       |  2 +-
 scripts/coccinelle/free/devm_free.cocci       |  4 +--
 scripts/coccinelle/free/ifnullfree.cocci      |  4 +--
 scripts/coccinelle/free/kfree.cocci           |  6 ++--
 scripts/coccinelle/free/kfreeaddr.cocci       |  2 +-
 security/apparmor/domain.c                    |  4 +--
 security/apparmor/include/file.h              |  2 +-
 security/apparmor/policy.c                    | 24 ++++++-------
 security/apparmor/policy_ns.c                 |  6 ++--
 security/apparmor/policy_unpack.c             | 14 ++++----
 security/keys/big_key.c                       |  6 ++--
 security/keys/dh.c                            | 14 ++++----
 security/keys/encrypted-keys/encrypted.c      | 14 ++++----
 security/keys/trusted-keys/trusted_tpm1.c     | 34 +++++++++----------
 security/keys/user_defined.c                  |  6 ++--
 115 files changed, 323 insertions(+), 321 deletions(-)

-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
