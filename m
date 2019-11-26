Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE810A50E
	for <lists.virtualization@lfdr.de>; Tue, 26 Nov 2019 21:06:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E9F4E86E7F;
	Tue, 26 Nov 2019 20:06:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wjcMgBoEQq7Z; Tue, 26 Nov 2019 20:06:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CB4EB86DC5;
	Tue, 26 Nov 2019 20:06:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A23F8C1DDB;
	Tue, 26 Nov 2019 20:06:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 211D4C0878
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Nov 2019 20:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 098DC845C3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Nov 2019 20:06:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LT5obgiK7tCs
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Nov 2019 20:06:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A3DA98458F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Nov 2019 20:06:35 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id a137so15482832qkc.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Nov 2019 12:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=uultcSB79qnw+ALfwxdMfifgB39K5WqtPerCJl0v7GU=;
 b=ZynqW5h0n4FdQySUIBFarO+JoVCCOzljANKyZrfHj9LngOALIK2aZj8paSXn1kCUf1
 vdUksD3mJeN1DIfPWPXNanJZEme439o3Nj4L2fHNGApg63o5CepyJm+YtH4eFmHipKiy
 x5NI1nD3nsbJgPIuU5/OajJbgzlK1+zas64oE6jwXLw9n7tszY7UQBmlSVn5vS6wgAZT
 0+RWOeLACtxbmMrDF6R6NibgAQxHfS0oyf/a0sgUyAM2lXCX7xH6V8D/DgGJwK0Jb9Yq
 enlICe3avRmzQnUUpDgpJGyLpDQHzpKRLQ5Ma1BLfSHHw6Cx0dG613vT9ia0kUJXiOdQ
 0nyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=uultcSB79qnw+ALfwxdMfifgB39K5WqtPerCJl0v7GU=;
 b=rtEgyGtmMp96zoWX6Nxxp808lwaawxmUEiXHdvRnhV711r/h0Xirhl+kCmWKhggDUE
 gE6HgMi/oyvMI8QPzuSEKbvvOtGImB1pMkQNGLDYVXIqybGfb1SXO7a/a39BF2B3yiMi
 Mx0BMNyY9qg2McZ1AvQULrUpyOmcvV2aql/L0gbnuPjwsooc42ovE3/LPOI561WMsLlC
 QpTolm75OFauWQg6RsKAub64nRLibhGsZlkfW1+qohAALB4rDBb1ajZSGvjqhooILacO
 9bKFQi5DKFTwZ4hQcVvgNAK9VYJSGP/MO8WQTFmOF4IdPb+4Sy/wnsxv5lKZwIzg32en
 9P9g==
X-Gm-Message-State: APjAAAX937eEM18wm/QnmFdShmA/gy7Q6oH7dHwZrmwFpowhuwnGH0eL
 Wtxw8pMtfTWW8MUbBllGvVw=
X-Google-Smtp-Source: APXvYqzvHd+ZhEuGnMIV1FIm93ei0Xt4lX2E8m8TMDpd2fr8S7lD97/79zO70VejAXxmw/WXNC/sGQ==
X-Received: by 2002:a37:a010:: with SMTP id j16mr244886qke.84.1574798794087;
 Tue, 26 Nov 2019 12:06:34 -0800 (PST)
Received: from ubuntu.default ([32.104.18.202])
 by smtp.gmail.com with ESMTPSA id d13sm6373562qta.67.2019.11.26.12.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 12:06:33 -0800 (PST)
From: Julio Faracco <jcfaracco@gmail.com>
To: netdev@vger.kernel.org
Subject: [net-next V3 0/2] drivers: net: virtio_net: implement
Date: Tue, 26 Nov 2019 17:06:26 -0300
Message-Id: <20191126200628.22251-1-jcfaracco@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: dnmendes76@gmail.com, virtualization@lists.linux-foundation.org,
 davem@davemloft.net, mst@redhat.com
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

This series add two important features. One of them changes the
.ndo_tx_timeout to include an extra parameter to identify the stuck
queue. Many drivers are using a nester loop to identify which queue is
stooped/stucked. This is a redundant work since dev_watchdog is doing
exactly the same thing. This is so interesting for other drivers to in
terms of code optimization.

The second part (second commit) introduces a virtnet_tx_timeout function
to reset virtio_net driver when a TX timeout happens. The main idea of
this implementation is related to a QEMU device issue. So, in this case,
resetting driver would be the best option to cover this scenario instead
of "soft recovery".

Changes from v1:
    - Missing net-next tag.
Changes from v2:
    - Adding the netdev patch produced by Michael (many thanks).
    - Using this stucture into virtnet and remove some stupid warn
      messages.

Julio Faracco (2):
  netdev: pass the stuck queue to the timeout handler
  drivers: net: virtio_net: Implement a dev_watchdog handler

 arch/m68k/emu/nfeth.c                         |  2 +-
 arch/um/drivers/net_kern.c                    |  2 +-
 arch/um/drivers/vector_kern.c                 |  2 +-
 arch/xtensa/platforms/iss/network.c           |  2 +-
 drivers/char/pcmcia/synclink_cs.c             |  2 +-
 drivers/infiniband/ulp/ipoib/ipoib_main.c     |  2 +-
 drivers/message/fusion/mptlan.c               |  2 +-
 drivers/misc/sgi-xp/xpnet.c                   |  2 +-
 drivers/net/appletalk/cops.c                  |  4 +-
 drivers/net/arcnet/arcdevice.h                |  2 +-
 drivers/net/arcnet/arcnet.c                   |  2 +-
 drivers/net/ethernet/3com/3c509.c             |  4 +-
 drivers/net/ethernet/3com/3c515.c             |  4 +-
 drivers/net/ethernet/3com/3c574_cs.c          |  4 +-
 drivers/net/ethernet/3com/3c589_cs.c          |  4 +-
 drivers/net/ethernet/3com/3c59x.c             |  4 +-
 drivers/net/ethernet/3com/typhoon.c           |  2 +-
 drivers/net/ethernet/8390/8390.c              |  4 +-
 drivers/net/ethernet/8390/8390.h              |  4 +-
 drivers/net/ethernet/8390/8390p.c             |  4 +-
 drivers/net/ethernet/8390/axnet_cs.c          |  4 +-
 drivers/net/ethernet/8390/lib8390.c           |  2 +-
 drivers/net/ethernet/adaptec/starfire.c       |  4 +-
 drivers/net/ethernet/agere/et131x.c           |  2 +-
 drivers/net/ethernet/allwinner/sun4i-emac.c   |  2 +-
 drivers/net/ethernet/alteon/acenic.c          |  4 +-
 drivers/net/ethernet/amazon/ena/ena_netdev.c  |  2 +-
 drivers/net/ethernet/amd/7990.c               |  2 +-
 drivers/net/ethernet/amd/7990.h               |  2 +-
 drivers/net/ethernet/amd/a2065.c              |  2 +-
 drivers/net/ethernet/amd/am79c961a.c          |  2 +-
 drivers/net/ethernet/amd/amd8111e.c           |  2 +-
 drivers/net/ethernet/amd/ariadne.c            |  2 +-
 drivers/net/ethernet/amd/atarilance.c         |  4 +-
 drivers/net/ethernet/amd/au1000_eth.c         |  2 +-
 drivers/net/ethernet/amd/declance.c           |  2 +-
 drivers/net/ethernet/amd/lance.c              |  4 +-
 drivers/net/ethernet/amd/ni65.c               |  4 +-
 drivers/net/ethernet/amd/nmclan_cs.c          |  4 +-
 drivers/net/ethernet/amd/pcnet32.c            |  4 +-
 drivers/net/ethernet/amd/sunlance.c           |  2 +-
 drivers/net/ethernet/amd/xgbe/xgbe-drv.c      |  2 +-
 drivers/net/ethernet/apm/xgene-v2/main.c      |  2 +-
 .../net/ethernet/apm/xgene/xgene_enet_main.c  |  2 +-
 drivers/net/ethernet/apple/macmace.c          |  4 +-
 drivers/net/ethernet/atheros/ag71xx.c         |  2 +-
 drivers/net/ethernet/atheros/alx/main.c       |  2 +-
 .../net/ethernet/atheros/atl1c/atl1c_main.c   |  2 +-
 .../net/ethernet/atheros/atl1e/atl1e_main.c   |  2 +-
 drivers/net/ethernet/atheros/atlx/atl2.c      |  2 +-
 drivers/net/ethernet/broadcom/b44.c           |  2 +-
 drivers/net/ethernet/broadcom/bcmsysport.c    |  2 +-
 drivers/net/ethernet/broadcom/bnx2.c          |  2 +-
 .../net/ethernet/broadcom/bnx2x/bnx2x_cmn.c   |  2 +-
 .../net/ethernet/broadcom/bnx2x/bnx2x_cmn.h   |  2 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c     |  2 +-
 .../net/ethernet/broadcom/genet/bcmgenet.c    |  2 +-
 drivers/net/ethernet/broadcom/sb1250-mac.c    |  4 +-
 drivers/net/ethernet/broadcom/tg3.c           |  2 +-
 drivers/net/ethernet/calxeda/xgmac.c          |  2 +-
 .../net/ethernet/cavium/liquidio/lio_main.c   |  2 +-
 .../ethernet/cavium/liquidio/lio_vf_main.c    |  2 +-
 .../net/ethernet/cavium/liquidio/lio_vf_rep.c |  5 +-
 .../net/ethernet/cavium/thunder/nicvf_main.c  |  2 +-
 drivers/net/ethernet/cirrus/cs89x0.c          |  2 +-
 drivers/net/ethernet/cisco/enic/enic_main.c   |  2 +-
 drivers/net/ethernet/cortina/gemini.c         |  2 +-
 drivers/net/ethernet/davicom/dm9000.c         |  2 +-
 drivers/net/ethernet/dec/tulip/de2104x.c      |  2 +-
 drivers/net/ethernet/dec/tulip/tulip_core.c   |  4 +-
 drivers/net/ethernet/dec/tulip/winbond-840.c  |  4 +-
 drivers/net/ethernet/dlink/dl2k.c             |  4 +-
 drivers/net/ethernet/dlink/sundance.c         |  4 +-
 drivers/net/ethernet/emulex/benet/be_main.c   |  2 +-
 drivers/net/ethernet/ethoc.c                  |  2 +-
 drivers/net/ethernet/faraday/ftgmac100.c      |  3 +-
 drivers/net/ethernet/fealnx.c                 |  4 +-
 drivers/net/ethernet/freescale/fec_main.c     |  2 +-
 drivers/net/ethernet/freescale/fec_mpc52xx.c  |  2 +-
 .../ethernet/freescale/fs_enet/fs_enet-main.c |  2 +-
 drivers/net/ethernet/freescale/gianfar.c      |  2 +-
 drivers/net/ethernet/freescale/ucc_geth.c     |  2 +-
 drivers/net/ethernet/fujitsu/fmvj18x_cs.c     |  4 +-
 drivers/net/ethernet/google/gve/gve_main.c    |  2 +-
 drivers/net/ethernet/hisilicon/hip04_eth.c    |  2 +-
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c |  2 +-
 drivers/net/ethernet/hisilicon/hns/hns_enet.c |  2 +-
 .../net/ethernet/hisilicon/hns3/hns3_enet.c   |  2 +-
 .../net/ethernet/huawei/hinic/hinic_main.c    |  2 +-
 drivers/net/ethernet/i825xx/82596.c           |  4 +-
 drivers/net/ethernet/i825xx/ether1.c          |  4 +-
 drivers/net/ethernet/i825xx/lib82596.c        |  4 +-
 drivers/net/ethernet/i825xx/sun3_82586.c      |  4 +-
 drivers/net/ethernet/ibm/ehea/ehea_main.c     |  2 +-
 drivers/net/ethernet/ibm/emac/core.c          |  2 +-
 drivers/net/ethernet/ibm/ibmvnic.c            |  2 +-
 drivers/net/ethernet/intel/e100.c             |  2 +-
 drivers/net/ethernet/intel/e1000/e1000_main.c |  4 +-
 drivers/net/ethernet/intel/e1000e/netdev.c    |  2 +-
 .../net/ethernet/intel/fm10k/fm10k_netdev.c   |  2 +-
 drivers/net/ethernet/intel/i40e/i40e_main.c   |  2 +-
 drivers/net/ethernet/intel/iavf/iavf_main.c   |  2 +-
 drivers/net/ethernet/intel/ice/ice_main.c     |  2 +-
 drivers/net/ethernet/intel/igb/igb_main.c     |  4 +-
 drivers/net/ethernet/intel/igbvf/netdev.c     |  2 +-
 drivers/net/ethernet/intel/ixgb/ixgb_main.c   |  4 +-
 .../net/ethernet/intel/ixgbe/ixgbe_debugfs.c  |  4 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c |  2 +-
 .../net/ethernet/intel/ixgbevf/ixgbevf_main.c |  2 +-
 drivers/net/ethernet/jme.c                    |  2 +-
 drivers/net/ethernet/korina.c                 |  2 +-
 drivers/net/ethernet/lantiq_etop.c            |  2 +-
 drivers/net/ethernet/marvell/mv643xx_eth.c    |  2 +-
 drivers/net/ethernet/marvell/pxa168_eth.c     |  2 +-
 drivers/net/ethernet/marvell/skge.c           |  2 +-
 drivers/net/ethernet/marvell/sky2.c           |  2 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c   |  2 +-
 .../net/ethernet/mellanox/mlx4/en_netdev.c    |  2 +-
 .../net/ethernet/mellanox/mlx5/core/en_main.c |  2 +-
 drivers/net/ethernet/micrel/ks8842.c          |  2 +-
 drivers/net/ethernet/micrel/ksz884x.c         |  2 +-
 drivers/net/ethernet/microchip/enc28j60.c     |  2 +-
 drivers/net/ethernet/microchip/encx24j600.c   |  2 +-
 drivers/net/ethernet/natsemi/natsemi.c        |  4 +-
 drivers/net/ethernet/natsemi/ns83820.c        |  2 +-
 drivers/net/ethernet/natsemi/sonic.c          |  2 +-
 drivers/net/ethernet/natsemi/sonic.h          |  2 +-
 drivers/net/ethernet/neterion/s2io.c          |  2 +-
 drivers/net/ethernet/neterion/s2io.h          |  2 +-
 .../net/ethernet/neterion/vxge/vxge-main.c    |  2 +-
 .../ethernet/netronome/nfp/nfp_net_common.c   |  2 +-
 drivers/net/ethernet/nvidia/forcedeth.c       |  2 +-
 .../ethernet/oki-semi/pch_gbe/pch_gbe_main.c  |  2 +-
 drivers/net/ethernet/packetengines/hamachi.c  |  4 +-
 .../net/ethernet/packetengines/yellowfin.c    |  4 +-
 .../net/ethernet/pensando/ionic/ionic_lif.c   |  2 +-
 .../ethernet/qlogic/netxen/netxen_nic_main.c  |  4 +-
 drivers/net/ethernet/qlogic/qla3xxx.c         |  2 +-
 .../net/ethernet/qlogic/qlcnic/qlcnic_main.c  |  4 +-
 drivers/net/ethernet/qualcomm/emac/emac.c     |  2 +-
 drivers/net/ethernet/qualcomm/qca_spi.c       |  2 +-
 drivers/net/ethernet/qualcomm/qca_uart.c      |  3 +-
 drivers/net/ethernet/rdc/r6040.c              |  2 +-
 drivers/net/ethernet/realtek/8139cp.c         |  2 +-
 drivers/net/ethernet/realtek/8139too.c        |  4 +-
 drivers/net/ethernet/realtek/atp.c            |  4 +-
 drivers/net/ethernet/realtek/r8169_main.c     |  2 +-
 drivers/net/ethernet/renesas/ravb_main.c      |  2 +-
 drivers/net/ethernet/renesas/sh_eth.c         |  2 +-
 .../net/ethernet/samsung/sxgbe/sxgbe_main.c   |  2 +-
 drivers/net/ethernet/seeq/ether3.c            |  4 +-
 drivers/net/ethernet/seeq/sgiseeq.c           |  2 +-
 drivers/net/ethernet/sgi/ioc3-eth.c           |  4 +-
 drivers/net/ethernet/sgi/meth.c               |  4 +-
 drivers/net/ethernet/silan/sc92031.c          |  2 +-
 drivers/net/ethernet/sis/sis190.c             |  2 +-
 drivers/net/ethernet/smsc/epic100.c           |  4 +-
 drivers/net/ethernet/smsc/smc911x.c           |  2 +-
 drivers/net/ethernet/smsc/smc9194.c           |  4 +-
 drivers/net/ethernet/smsc/smc91c92_cs.c       |  4 +-
 drivers/net/ethernet/smsc/smc91x.c            |  2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  2 +-
 drivers/net/ethernet/sun/cassini.c            |  2 +-
 drivers/net/ethernet/sun/niu.c                |  2 +-
 drivers/net/ethernet/sun/sunbmac.c            |  2 +-
 drivers/net/ethernet/sun/sungem.c             |  2 +-
 drivers/net/ethernet/sun/sunhme.c             |  2 +-
 drivers/net/ethernet/sun/sunqe.c              |  2 +-
 drivers/net/ethernet/sun/sunvnet_common.c     |  2 +-
 drivers/net/ethernet/sun/sunvnet_common.h     |  2 +-
 .../net/ethernet/synopsys/dwc-xlgmac-net.c    |  2 +-
 drivers/net/ethernet/ti/cpmac.c               |  2 +-
 drivers/net/ethernet/ti/cpsw_priv.c           |  2 +-
 drivers/net/ethernet/ti/davinci_emac.c        |  2 +-
 drivers/net/ethernet/ti/netcp_core.c          |  2 +-
 drivers/net/ethernet/ti/tlan.c                |  4 +-
 drivers/net/ethernet/toshiba/ps3_gelic_net.c  |  2 +-
 drivers/net/ethernet/toshiba/ps3_gelic_net.h  |  2 +-
 drivers/net/ethernet/toshiba/spider_net.c     |  2 +-
 drivers/net/ethernet/toshiba/tc35815.c        |  5 +-
 drivers/net/ethernet/via/via-rhine.c          |  4 +-
 drivers/net/ethernet/wiznet/w5100.c           |  2 +-
 drivers/net/ethernet/wiznet/w5300.c           |  2 +-
 drivers/net/ethernet/xilinx/xilinx_emaclite.c |  2 +-
 drivers/net/ethernet/xircom/xirc2ps_cs.c      |  4 +-
 drivers/net/fjes/fjes_main.c                  |  4 +-
 drivers/net/slip/slip.c                       |  2 +-
 drivers/net/usb/catc.c                        |  2 +-
 drivers/net/usb/hso.c                         |  2 +-
 drivers/net/usb/ipheth.c                      |  2 +-
 drivers/net/usb/kaweth.c                      |  2 +-
 drivers/net/usb/lan78xx.c                     |  2 +-
 drivers/net/usb/pegasus.c                     |  2 +-
 drivers/net/usb/r8152.c                       |  2 +-
 drivers/net/usb/rtl8150.c                     |  2 +-
 drivers/net/usb/usbnet.c                      |  2 +-
 drivers/net/virtio_net.c                      | 83 ++++++++++++++++++-
 drivers/net/vmxnet3/vmxnet3_drv.c             |  2 +-
 drivers/net/wan/cosa.c                        |  4 +-
 drivers/net/wan/farsync.c                     |  2 +-
 drivers/net/wan/fsl_ucc_hdlc.c                |  2 +-
 drivers/net/wan/lmc/lmc_main.c                |  4 +-
 drivers/net/wan/x25_asy.c                     |  2 +-
 drivers/net/wireless/intel/ipw2x00/ipw2100.c  |  2 +-
 .../wireless/intersil/hostap/hostap_main.c    |  2 +-
 drivers/net/wireless/intersil/orinoco/main.c  |  2 +-
 .../net/wireless/intersil/orinoco/orinoco.h   |  2 +-
 .../wireless/intersil/prism54/islpci_eth.c    |  2 +-
 .../wireless/intersil/prism54/islpci_eth.h    |  2 +-
 drivers/net/wireless/marvell/mwifiex/main.c   |  2 +-
 drivers/net/wireless/quantenna/qtnfmac/core.c |  3 +-
 drivers/net/wireless/wl3501_cs.c              |  2 +-
 drivers/net/wireless/zydas/zd1201.c           |  2 +-
 drivers/s390/net/qeth_core.h                  |  2 +-
 drivers/s390/net/qeth_core_main.c             |  2 +-
 drivers/staging/ks7010/ks_wlan_net.c          |  4 +-
 drivers/staging/qlge/qlge_main.c              |  2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  2 +-
 drivers/staging/rtl8192u/r8192U_core.c        |  2 +-
 .../staging/unisys/visornic/visornic_main.c   |  3 +-
 drivers/staging/wlan-ng/p80211netdev.c        |  6 +-
 drivers/tty/n_gsm.c                           |  2 +-
 drivers/tty/synclink.c                        |  2 +-
 drivers/tty/synclink_gt.c                     |  2 +-
 drivers/tty/synclinkmp.c                      |  2 +-
 include/linux/netdevice.h                     |  5 +-
 include/linux/usb/usbnet.h                    |  2 +-
 net/atm/lec.c                                 |  2 +-
 net/bluetooth/bnep/netdev.c                   |  2 +-
 net/sched/sch_generic.c                       |  2 +-
 230 files changed, 378 insertions(+), 286 deletions(-)

-- 
2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
