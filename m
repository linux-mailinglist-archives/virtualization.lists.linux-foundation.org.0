Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 154CD11719B
	for <lists.virtualization@lfdr.de>; Mon,  9 Dec 2019 17:29:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B49188691A;
	Mon,  9 Dec 2019 16:29:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0W9SFTl9LjFU; Mon,  9 Dec 2019 16:29:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A5D7D8691C;
	Mon,  9 Dec 2019 16:29:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A3E0C0881;
	Mon,  9 Dec 2019 16:29:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01854C0881
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 16:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E3C8C87778
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 16:29:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ogm1lm3hJr-f
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 16:29:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 11F428768C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575908946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HfKO4fNE9Z1ijsc7lYtm9Lc3bhI9OtiAOvE5o5rqhBk=;
 b=L/D1u4gaaEeipprDvG6kt3d0trPQiAh1HGYRlGn2jGrm7VxTG7FU34BnfXp2uY54duKaES
 6+4fZCVyKYaC07jeAre2CNxOZqRDiUvKsa4ysWGdg57eckODCScSn0a3zwOo/IC5CRLuNR
 erHTOSwPdmdBDsNyaxEgPbsH5yPxzns=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-57wfptHsOoCT2D1oqHJyvA-1; Mon, 09 Dec 2019 11:29:05 -0500
Received: by mail-qv1-f70.google.com with SMTP id 75so4923632qva.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 09 Dec 2019 08:29:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=AqoaljosjaXxq0B8X2WRF4kPLe5Y7scpwAXXkb+taFc=;
 b=r1ibVBjTj/agaGWweWgmgZYT6wVn3EcB/NaFtt5k2h1vtgktoRkSmDJfAp68wfCq2w
 ZBIKo/veKZ1sDl1XX2ZdMbmd/jwsBaHYAd+N2fMhUMgzJsgc7yTVWFp4ICSr3oEChjD3
 us4oh2mupVPPJV6yt3cA+Yt0Ttb5O8tHR+76Wcxjh3rYWiBTxVuFSqo4/8yz73rMp+yS
 LQAACmiU/oUk3rOdNFk0/cGEBk/FZ0OOVxti3ohMaDEAaY79ysbDmWFkA7Hdn4UAehSq
 Q7QgxP79BwKy+mhld0/T7YU8oqGDH50W36Ri48l0f7cg+pW8HBL0dEkzO17bLG/z60aE
 Msww==
X-Gm-Message-State: APjAAAVPLIZYdzJ7r/UiEFKNardlNl/QvbElAQpQqb2cUOHetuD+W3Nb
 7L64p6Jv3wpTttQkSPtcYeQ+Ez8B9jvbX1cOGwSYhF/+md65FrYTQz7NDI8zJHcB9kkhFdqJjIy
 9dFzt81hwmwgxfRuX46xnb96OUn7PRRXY5aS+16ll3w==
X-Received: by 2002:a37:6294:: with SMTP id w142mr628708qkb.284.1575908943248; 
 Mon, 09 Dec 2019 08:29:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqzM4MJaHpsO2cFP0VbNhiKdqHmdXEIsNIOQICm8PhIBxpkH9u+8r+MzmIPPEbQ/qbpt6p4d/A==
X-Received: by 2002:a37:6294:: with SMTP id w142mr628671qkb.284.1575908942796; 
 Mon, 09 Dec 2019 08:29:02 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id t16sm12549qtn.74.2019.12.09.08.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 08:29:01 -0800 (PST)
Date: Mon, 9 Dec 2019 11:28:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org, Julio Faracco <jcfaracco@gmail.com>
Subject: [PATCH net-next v9 0/3] netdev: ndo_tx_timeout cleanup
Message-ID: <20191209162727.10113-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-MC-Unique: 57wfptHsOoCT2D1oqHJyvA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: dnmendes76@gmail.com, mst@redhat.com, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, davem@davemloft.net
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


A bunch of drivers want to know which tx queue triggered a timeout,
and virtio wants to do the same.
We actually have the info to hand, let's just pass it on to drivers.
Note: tested with an experimental virtio patch by Julio.
That patch itself isn't ready yet though, so not included.
Other drivers compiled only.


Michael S. Tsirkin (3):
  netdev: pass the stuck queue to the timeout handler
  mlx4: use new txqueue timeout argument
  netronome: use the new txqueue timeout argument

 arch/m68k/emu/nfeth.c                            |  2 +-
 arch/um/drivers/net_kern.c                       |  2 +-
 arch/um/drivers/vector_kern.c                    |  2 +-
 arch/xtensa/platforms/iss/network.c              |  2 +-
 drivers/char/pcmcia/synclink_cs.c                |  2 +-
 drivers/infiniband/ulp/ipoib/ipoib_main.c        |  2 +-
 drivers/message/fusion/mptlan.c                  |  2 +-
 drivers/misc/sgi-xp/xpnet.c                      |  2 +-
 drivers/net/appletalk/cops.c                     |  4 ++--
 drivers/net/arcnet/arcdevice.h                   |  2 +-
 drivers/net/arcnet/arcnet.c                      |  2 +-
 drivers/net/ethernet/3com/3c509.c                |  4 ++--
 drivers/net/ethernet/3com/3c515.c                |  4 ++--
 drivers/net/ethernet/3com/3c574_cs.c             |  4 ++--
 drivers/net/ethernet/3com/3c589_cs.c             |  4 ++--
 drivers/net/ethernet/3com/3c59x.c                |  4 ++--
 drivers/net/ethernet/3com/typhoon.c              |  2 +-
 drivers/net/ethernet/8390/8390.c                 |  4 ++--
 drivers/net/ethernet/8390/8390.h                 |  2 +-
 drivers/net/ethernet/8390/8390p.c                |  4 ++--
 drivers/net/ethernet/8390/axnet_cs.c             |  4 ++--
 drivers/net/ethernet/8390/lib8390.c              |  2 +-
 drivers/net/ethernet/adaptec/starfire.c          |  4 ++--
 drivers/net/ethernet/agere/et131x.c              |  2 +-
 drivers/net/ethernet/allwinner/sun4i-emac.c      |  2 +-
 drivers/net/ethernet/alteon/acenic.c             |  4 ++--
 drivers/net/ethernet/amazon/ena/ena_netdev.c     |  2 +-
 drivers/net/ethernet/amd/7990.c                  |  2 +-
 drivers/net/ethernet/amd/7990.h                  |  2 +-
 drivers/net/ethernet/amd/a2065.c                 |  2 +-
 drivers/net/ethernet/amd/am79c961a.c             |  2 +-
 drivers/net/ethernet/amd/amd8111e.c              |  2 +-
 drivers/net/ethernet/amd/ariadne.c               |  2 +-
 drivers/net/ethernet/amd/atarilance.c            |  4 ++--
 drivers/net/ethernet/amd/au1000_eth.c            |  2 +-
 drivers/net/ethernet/amd/declance.c              |  2 +-
 drivers/net/ethernet/amd/lance.c                 |  4 ++--
 drivers/net/ethernet/amd/ni65.c                  |  4 ++--
 drivers/net/ethernet/amd/nmclan_cs.c             |  4 ++--
 drivers/net/ethernet/amd/pcnet32.c               |  4 ++--
 drivers/net/ethernet/amd/sunlance.c              |  2 +-
 drivers/net/ethernet/amd/xgbe/xgbe-drv.c         |  2 +-
 drivers/net/ethernet/apm/xgene-v2/main.c         |  2 +-
 drivers/net/ethernet/apm/xgene/xgene_enet_main.c |  2 +-
 drivers/net/ethernet/apple/macmace.c             |  4 ++--
 drivers/net/ethernet/atheros/ag71xx.c            |  2 +-
 drivers/net/ethernet/atheros/alx/main.c          |  2 +-
 drivers/net/ethernet/atheros/atl1c/atl1c_main.c  |  2 +-
 drivers/net/ethernet/atheros/atl1e/atl1e_main.c  |  2 +-
 drivers/net/ethernet/atheros/atlx/atl2.c         |  2 +-
 drivers/net/ethernet/atheros/atlx/atlx.c         |  2 +-
 drivers/net/ethernet/broadcom/b44.c              |  2 +-
 drivers/net/ethernet/broadcom/bcmsysport.c       |  2 +-
 drivers/net/ethernet/broadcom/bnx2.c             |  2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c  |  2 +-
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.h  |  2 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c        |  2 +-
 drivers/net/ethernet/broadcom/genet/bcmgenet.c   |  2 +-
 drivers/net/ethernet/broadcom/sb1250-mac.c       |  4 ++--
 drivers/net/ethernet/broadcom/tg3.c              |  2 +-
 drivers/net/ethernet/calxeda/xgmac.c             |  2 +-
 drivers/net/ethernet/cavium/liquidio/lio_main.c  |  2 +-
 .../net/ethernet/cavium/liquidio/lio_vf_main.c   |  2 +-
 .../net/ethernet/cavium/liquidio/lio_vf_rep.c    |  4 ++--
 drivers/net/ethernet/cavium/thunder/nicvf_main.c |  2 +-
 drivers/net/ethernet/cirrus/cs89x0.c             |  2 +-
 drivers/net/ethernet/cisco/enic/enic_main.c      |  2 +-
 drivers/net/ethernet/cortina/gemini.c            |  2 +-
 drivers/net/ethernet/davicom/dm9000.c            |  2 +-
 drivers/net/ethernet/dec/tulip/de2104x.c         |  2 +-
 drivers/net/ethernet/dec/tulip/tulip_core.c      |  4 ++--
 drivers/net/ethernet/dec/tulip/winbond-840.c     |  4 ++--
 drivers/net/ethernet/dlink/dl2k.c                |  4 ++--
 drivers/net/ethernet/dlink/sundance.c            |  4 ++--
 drivers/net/ethernet/emulex/benet/be_main.c      |  2 +-
 drivers/net/ethernet/ethoc.c                     |  2 +-
 drivers/net/ethernet/faraday/ftgmac100.c         |  2 +-
 drivers/net/ethernet/fealnx.c                    |  4 ++--
 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c   |  2 +-
 drivers/net/ethernet/freescale/fec_main.c        |  2 +-
 drivers/net/ethernet/freescale/fec_mpc52xx.c     |  2 +-
 .../ethernet/freescale/fs_enet/fs_enet-main.c    |  2 +-
 drivers/net/ethernet/freescale/gianfar.c         |  2 +-
 drivers/net/ethernet/freescale/ucc_geth.c        |  2 +-
 drivers/net/ethernet/fujitsu/fmvj18x_cs.c        |  4 ++--
 drivers/net/ethernet/google/gve/gve_main.c       |  2 +-
 drivers/net/ethernet/hisilicon/hip04_eth.c       |  2 +-
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c    |  2 +-
 drivers/net/ethernet/hisilicon/hns/hns_enet.c    |  2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c  |  2 +-
 drivers/net/ethernet/huawei/hinic/hinic_main.c   |  2 +-
 drivers/net/ethernet/i825xx/82596.c              |  4 ++--
 drivers/net/ethernet/i825xx/ether1.c             |  4 ++--
 drivers/net/ethernet/i825xx/lib82596.c           |  4 ++--
 drivers/net/ethernet/i825xx/sun3_82586.c         |  4 ++--
 drivers/net/ethernet/ibm/ehea/ehea_main.c        |  2 +-
 drivers/net/ethernet/ibm/emac/core.c             |  2 +-
 drivers/net/ethernet/ibm/ibmvnic.c               |  2 +-
 drivers/net/ethernet/intel/e100.c                |  2 +-
 drivers/net/ethernet/intel/e1000/e1000_main.c    |  4 ++--
 drivers/net/ethernet/intel/e1000e/netdev.c       |  2 +-
 drivers/net/ethernet/intel/fm10k/fm10k_netdev.c  |  2 +-
 drivers/net/ethernet/intel/i40e/i40e_main.c      |  2 +-
 drivers/net/ethernet/intel/iavf/iavf_main.c      |  2 +-
 drivers/net/ethernet/intel/ice/ice_main.c        |  2 +-
 drivers/net/ethernet/intel/igb/igb_main.c        |  4 ++--
 drivers/net/ethernet/intel/igbvf/netdev.c        |  2 +-
 drivers/net/ethernet/intel/ixgb/ixgb_main.c      |  4 ++--
 drivers/net/ethernet/intel/ixgbe/ixgbe_debugfs.c |  4 +++-
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c    |  2 +-
 .../net/ethernet/intel/ixgbevf/ixgbevf_main.c    |  2 +-
 drivers/net/ethernet/jme.c                       |  2 +-
 drivers/net/ethernet/korina.c                    |  2 +-
 drivers/net/ethernet/lantiq_etop.c               |  2 +-
 drivers/net/ethernet/marvell/mv643xx_eth.c       |  2 +-
 drivers/net/ethernet/marvell/pxa168_eth.c        |  2 +-
 drivers/net/ethernet/marvell/skge.c              |  2 +-
 drivers/net/ethernet/marvell/sky2.c              |  2 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c      |  2 +-
 drivers/net/ethernet/mellanox/mlx4/en_netdev.c   | 16 +++++-----------
 .../net/ethernet/mellanox/mlx5/core/en_main.c    |  2 +-
 drivers/net/ethernet/micrel/ks8842.c             |  2 +-
 drivers/net/ethernet/micrel/ksz884x.c            |  2 +-
 drivers/net/ethernet/microchip/enc28j60.c        |  2 +-
 drivers/net/ethernet/microchip/encx24j600.c      |  2 +-
 drivers/net/ethernet/natsemi/natsemi.c           |  4 ++--
 drivers/net/ethernet/natsemi/ns83820.c           |  4 ++--
 drivers/net/ethernet/natsemi/sonic.c             |  2 +-
 drivers/net/ethernet/natsemi/sonic.h             |  2 +-
 drivers/net/ethernet/neterion/s2io.c             |  2 +-
 drivers/net/ethernet/neterion/s2io.h             |  2 +-
 drivers/net/ethernet/neterion/vxge/vxge-main.c   |  2 +-
 .../net/ethernet/netronome/nfp/nfp_net_common.c  | 10 ++--------
 drivers/net/ethernet/nvidia/forcedeth.c          |  2 +-
 .../net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c |  2 +-
 drivers/net/ethernet/packetengines/hamachi.c     |  4 ++--
 drivers/net/ethernet/packetengines/yellowfin.c   |  4 ++--
 drivers/net/ethernet/pensando/ionic/ionic_lif.c  |  2 +-
 .../net/ethernet/qlogic/netxen/netxen_nic_main.c |  4 ++--
 drivers/net/ethernet/qlogic/qla3xxx.c            |  2 +-
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c |  4 ++--
 drivers/net/ethernet/qualcomm/emac/emac.c        |  2 +-
 drivers/net/ethernet/qualcomm/qca_spi.c          |  2 +-
 drivers/net/ethernet/qualcomm/qca_uart.c         |  2 +-
 drivers/net/ethernet/rdc/r6040.c                 |  2 +-
 drivers/net/ethernet/realtek/8139cp.c            |  2 +-
 drivers/net/ethernet/realtek/8139too.c           |  4 ++--
 drivers/net/ethernet/realtek/atp.c               |  4 ++--
 drivers/net/ethernet/realtek/r8169_main.c        |  2 +-
 drivers/net/ethernet/renesas/ravb_main.c         |  2 +-
 drivers/net/ethernet/renesas/sh_eth.c            |  2 +-
 drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c  |  2 +-
 drivers/net/ethernet/seeq/ether3.c               |  4 ++--
 drivers/net/ethernet/seeq/sgiseeq.c              |  2 +-
 drivers/net/ethernet/sfc/efx.c                   |  2 +-
 drivers/net/ethernet/sfc/falcon/efx.c            |  2 +-
 drivers/net/ethernet/sgi/ioc3-eth.c              |  4 ++--
 drivers/net/ethernet/sgi/meth.c                  |  4 ++--
 drivers/net/ethernet/silan/sc92031.c             |  2 +-
 drivers/net/ethernet/sis/sis190.c                |  2 +-
 drivers/net/ethernet/sis/sis900.c                |  4 ++--
 drivers/net/ethernet/smsc/epic100.c              |  4 ++--
 drivers/net/ethernet/smsc/smc911x.c              |  2 +-
 drivers/net/ethernet/smsc/smc9194.c              |  4 ++--
 drivers/net/ethernet/smsc/smc91c92_cs.c          |  4 ++--
 drivers/net/ethernet/smsc/smc91x.c               |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c    |  2 +-
 drivers/net/ethernet/sun/cassini.c               |  2 +-
 drivers/net/ethernet/sun/niu.c                   |  2 +-
 drivers/net/ethernet/sun/sunbmac.c               |  2 +-
 drivers/net/ethernet/sun/sungem.c                |  2 +-
 drivers/net/ethernet/sun/sunhme.c                |  2 +-
 drivers/net/ethernet/sun/sunqe.c                 |  2 +-
 drivers/net/ethernet/sun/sunvnet_common.c        |  2 +-
 drivers/net/ethernet/sun/sunvnet_common.h        |  2 +-
 drivers/net/ethernet/synopsys/dwc-xlgmac-net.c   |  2 +-
 drivers/net/ethernet/ti/cpmac.c                  |  2 +-
 drivers/net/ethernet/ti/cpsw_priv.c              |  2 +-
 drivers/net/ethernet/ti/cpsw_priv.h              |  2 +-
 drivers/net/ethernet/ti/davinci_emac.c           |  2 +-
 drivers/net/ethernet/ti/netcp_core.c             |  2 +-
 drivers/net/ethernet/ti/tlan.c                   |  6 +++---
 drivers/net/ethernet/toshiba/ps3_gelic_net.c     |  2 +-
 drivers/net/ethernet/toshiba/ps3_gelic_net.h     |  2 +-
 drivers/net/ethernet/toshiba/spider_net.c        |  2 +-
 drivers/net/ethernet/toshiba/tc35815.c           |  4 ++--
 drivers/net/ethernet/via/via-rhine.c             |  4 ++--
 drivers/net/ethernet/wiznet/w5100.c              |  2 +-
 drivers/net/ethernet/wiznet/w5300.c              |  2 +-
 drivers/net/ethernet/xilinx/xilinx_emaclite.c    |  2 +-
 drivers/net/ethernet/xircom/xirc2ps_cs.c         |  4 ++--
 drivers/net/fjes/fjes_main.c                     |  4 ++--
 drivers/net/slip/slip.c                          |  2 +-
 drivers/net/usb/catc.c                           |  2 +-
 drivers/net/usb/hso.c                            |  2 +-
 drivers/net/usb/ipheth.c                         |  2 +-
 drivers/net/usb/kaweth.c                         |  2 +-
 drivers/net/usb/lan78xx.c                        |  2 +-
 drivers/net/usb/pegasus.c                        |  2 +-
 drivers/net/usb/r8152.c                          |  2 +-
 drivers/net/usb/rtl8150.c                        |  2 +-
 drivers/net/usb/usbnet.c                         |  2 +-
 drivers/net/vmxnet3/vmxnet3_drv.c                |  2 +-
 drivers/net/wan/cosa.c                           |  4 ++--
 drivers/net/wan/farsync.c                        |  2 +-
 drivers/net/wan/fsl_ucc_hdlc.c                   |  2 +-
 drivers/net/wan/lmc/lmc_main.c                   |  4 ++--
 drivers/net/wan/x25_asy.c                        |  2 +-
 drivers/net/wimax/i2400m/netdev.c                |  2 +-
 drivers/net/wireless/intel/ipw2x00/ipw2100.c     |  2 +-
 .../net/wireless/intersil/hostap/hostap_main.c   |  2 +-
 drivers/net/wireless/intersil/orinoco/main.c     |  2 +-
 drivers/net/wireless/intersil/orinoco/orinoco.h  |  2 +-
 .../net/wireless/intersil/prism54/islpci_eth.c   |  2 +-
 .../net/wireless/intersil/prism54/islpci_eth.h   |  2 +-
 drivers/net/wireless/marvell/mwifiex/main.c      |  2 +-
 drivers/net/wireless/quantenna/qtnfmac/core.c    |  2 +-
 drivers/net/wireless/wl3501_cs.c                 |  2 +-
 drivers/net/wireless/zydas/zd1201.c              |  2 +-
 drivers/s390/net/qeth_core.h                     |  2 +-
 drivers/s390/net/qeth_core_main.c                |  2 +-
 drivers/staging/ks7010/ks_wlan_net.c             |  4 ++--
 drivers/staging/qlge/qlge_main.c                 |  2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c     |  2 +-
 drivers/staging/rtl8192u/r8192U_core.c           |  2 +-
 drivers/staging/unisys/visornic/visornic_main.c  |  2 +-
 drivers/staging/wlan-ng/p80211netdev.c           |  4 ++--
 drivers/tty/n_gsm.c                              |  2 +-
 drivers/tty/synclink.c                           |  2 +-
 drivers/tty/synclink_gt.c                        |  2 +-
 drivers/tty/synclinkmp.c                         |  2 +-
 include/linux/netdevice.h                        |  5 +++--
 include/linux/usb/usbnet.h                       |  2 +-
 net/atm/lec.c                                    |  2 +-
 net/bluetooth/bnep/netdev.c                      |  2 +-
 net/sched/sch_generic.c                          |  2 +-
 236 files changed, 302 insertions(+), 311 deletions(-)

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
